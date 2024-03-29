(after! mu4e
  (setq mu4e-root-maildir (expand-file-name "~/Mail/Main")
        mu4e-headers-date-format "%d/%m/%Y"
        mu4e-headers-time-format "%H:%M"
        mu4e-drafts-folder "/Drafts"
        mu4e-sent-folder "/Sent"
        mu4e-trash-folder "/Trash"
        mu4e-spam-folder "/Spam"
        mu4e-refile-folder "/Archive"
        mu4e-compose-format-flowed t
        mu4e-headers-toggle-skip-duplicates nil)

  (setq! mu4e-get-mail-command "offlineimap")
  (setq mu4e-alert-interesting-mail-query
        (concat
         "flag:unread"
         " AND maildir:\"/INBOX\""))

  (setq mu4e-bookmarks '(("maildir:/INBOX" "Inbox" ?i)
                         ("maildir:/INBOX AND flag:flagged" "Flagged messages" ?f)
                         ("maildir:/INBOX AND flag:unread" "Unread messages" ?u)
                         ("maildir:/INBOX AND date:today..now" "Today's messages" ?t)
                         ("maildir:/INBOX AND date:7d..now" "Last 7 days" ?w)))

  ;; Mark as read and move to spam
  (add-to-list 'mu4e-marks
               '(spam
                 :char "S"
                 :prompt "Spam"
                 :show-target (lambda (target) mu4e-spam-folder)
                 :action (lambda (docid msg target)
                           (mu4e~proc-move docid mu4e-spam-folder "+S-u-N"))))

  (mu4e~headers-defun-mark-for spam)
  (define-key mu4e-headers-mode-map (kbd "S") 'mu4e-headers-mark-for-spam)

  (setq sendmail-program "/usr/bin/msmtp"
        send-mail-function 'smtpmail-send-it
        message-sendmail-f-is-evil t
        message-sendmail-extra-arguments '("--read-envelope-from")
        message-send-mail-function 'message-send-mail-with-sendmail))
