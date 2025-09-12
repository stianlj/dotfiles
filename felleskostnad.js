const rekkehus = [
  117,
  113,
  106,
  106,
  123,
  112,
  117,
  113,
  106,
  106,
  123,
  112,
  120,
  109,
  112,
  120,
  109,
  112,
  117,
  107,
  113,
  113,
  115,
  106,
  116,
]

const hus = [
  { nummer: 1, kvm: 117 },
  { nummer: 2, kvm: 113 },
  { nummer: 3, kvm: 106 },
  { nummer: 4, kvm: 106 },
  { nummer: 5, kvm: 123 },
  { nummer: 6, kvm: 112 },
  { nummer: 7, kvm: 117 },
  { nummer: 8, kvm: 113 },
  { nummer: 9, kvm: 106 },
  { nummer: 10, kvm: 106 },
  { nummer: 11, kvm: 123 },
  { nummer: 12, kvm: 112 },
  { nummer: 13, kvm: 120 },
  { nummer: 14, kvm: 109 },
  { nummer: 15, kvm: 112 },
  { nummer: 16, kvm: 120 },
  { nummer: 17, kvm: 109 },
  { nummer: 18, kvm: 112 },
  { nummer: 19, kvm: 117 },
  { nummer: 20, kvm: 107 },
  { nummer: 21, kvm: 113 },
  { nummer: 22, kvm: 113 },
  { nummer: 23, kvm: 115 },
  { nummer: 24, kvm: 106 },
  { nummer: 25, kvm: 116 },
  { nummer: 26, kvm: 72 },
  { nummer: 27, kvm: 72 },
  { nummer: 28, kvm: 72 },
  { nummer: 29, kvm: 72 },
  { nummer: 30, kvm: 72 },
  { nummer: 31, kvm: 72 },
  { nummer: 32, kvm: 72 },
  { nummer: 33, kvm: 72 },
]

const leiligheter = [72, 72, 72, 72, 72, 72, 72, 72]
const arealTilSammen = 3399
const okning = 393
const antallEnheter = 33
const okningISum = okning * antallEnheter

function median(array) {
  const mid = Math.floor(array.length / 2)
  const nums = [...array].sort((a, b) => a - b)
  return array.length % 2 !== 0 ? nums[mid] : (nums[mid - 1] + nums[mid]) / 2
}

const averageRekkehus =
  // eslint-disable-next-line unicorn/no-array-reduce
  rekkehus.reduce((accumulator, currentValue) => accumulator + currentValue, 0) / rekkehus.length
const medianRekkehus = median(rekkehus)
const medianLeilighet = median(leiligheter)

console.log('Økning i sum:', okningISum)
console.log('Gjennomsnitt rekkehus:', averageRekkehus)
console.log('Median rekkehus:', medianRekkehus)
console.log('Median leiligheter:', medianLeilighet)

const rekkehusPercent = Number.parseFloat((medianRekkehus / arealTilSammen) * 100).toFixed(2)
const leilighetPercent = Number.parseFloat((medianLeilighet / arealTilSammen) * 100).toFixed(2)

console.log('Rekkehusprosent:', rekkehusPercent)
console.log('Leilighetprosent:', leilighetPercent)

const rekkehusBetale = Math.round((rekkehusPercent * okningISum) / 100)
const leilighetBetale = Math.round((leilighetPercent * okningISum) / 100)

console.log('Rekkehus skal betale:', rekkehusBetale)
console.log('Leilighet skal betale:', leilighetBetale)

for (const huset of hus) {
  const husetPercent = Number.parseFloat((huset.kvm / arealTilSammen) * 100).toFixed(2)
  const husetBetale = Math.round((husetPercent * okningISum) / 100)
  console.log(
    `Seksjon ${huset.nummer}: ${huset.kvm} kvm = ${husetPercent} % (${husetBetale} kroner)`
  )
}
