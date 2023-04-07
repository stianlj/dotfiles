#!/usr/bin/env node

import fs from 'fs/promises'
import superagent from 'superagent'
import shell from 'shelljs'
import path from 'node:path'

const { HOME } = process.env
const NEXTCLOUD_NOTES_DIR = `${HOME}/Nextcloud/Notes/`
const LINKS_FOLDER = 'Links/'
const LINKS_SYNCED_FOLDER = 'Links/Synced/'

async function orgProtocolCaptureLink({ title, url }) {
  const parameters = parameterize({
    template: 'L',
    url,
    title: title.replace(/"/g, '\\"'),
  })
  return shell.exec(`emacsclient -n "org-protocol://capture?${parameters}"`)
}

async function linkFileContentHandler(filepath) {
  const content = await fs.readFile(filepath, { encoding: 'utf-8' })
  if (validateUrl(content)) {
    const { statusCode, text } = await superagent.get(content)
    if (statusCode === 200) {
      const match = text.match(/<title>([^<]*)<\/title>/)
      if (!match || typeof match[1] !== 'string') {
        return { content, filepath }
      }
      return { content, title: match[1], url: content, filepath }
    }
    return { content, filepath }
  } else if (content.startsWith('[')) {
    const title = content.slice(content.indexOf('[') + 1, content.indexOf(']'))
    const url = content.slice(content.indexOf('(') + 1, content.indexOf(')'))
    return { content, title, url, filepath }
  }
  return { content, filepath }
}

async function main() {
  try {
    const files = await fs.readdir(`${NEXTCLOUD_NOTES_DIR}${LINKS_FOLDER}`)
    const links = await Promise.all(
      files.map(async (file) => {
        if (file !== 'PLACEHOLDER.txt') {
          const filepath = `${NEXTCLOUD_NOTES_DIR}${LINKS_FOLDER}${file}`
          const stat = await fs.stat(filepath)
          if (stat.isFile()) {
            return linkFileContentHandler(filepath)
          }
        }
        return {}
      })
    )
    const cleanLinks = links.filter((it) => !isObjectEmpty(it))

    for (const { title, url, filepath } of cleanLinks) {
      if (title && url) {
        console.log(`Capture: [${title}] with url [${url}]`)
        const { code, stderr } = await orgProtocolCaptureLink({ title, url })
        if (code === 0) {
          const to = `${NEXTCLOUD_NOTES_DIR}${LINKS_SYNCED_FOLDER}${path.basename(filepath)}`
          console.log(`Synced: Move from ${filepath} to ${to}`)
          await fs.rename(filepath, to)
        } else {
          console.error(`ERROR: [${title}] failed`, stderr)
        }
      }
    }
  } catch (error) {
    console.error(error)
    process.exit(1)
  }
}

main()

function validateUrl(url) {
  return /^(http(s):\/\/.)[\w#%+.:=@~-]{2,256}\.[a-z]{2,6}\b([\w#%&+./:=?@~-]*)$/g.test(url)
}

function isObjectEmpty(object) {
  return Object.keys(object).length === 0
}

function parameterize(parameters) {
  return Object.keys(parameters)
    .map((key) => {
      return `${key}=${parameters[key]}`
    })
    .join('&')
}
