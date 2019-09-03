# MFA

mfa is a command line two-factor authentication code generator.

Usage:
    mfa -add [-7] [-8] [-hotp] name
    mfa -list
    mfa name

`mfa -add name` adds a new key to the mfa keychain with the given name. It
prints a prompt to standard error and reads a two-factor key from standard
input. Two-factor keys are short case-insensitive strings of letters A-Z and
digits 2-7.

By default the new key generates time-based (TOTP) authentication codes; the
`-hotp` flag makes the new key generate counter-based (HOTP) codes instead.

By default the new key generates 6-digit codes; the `-7` and `-8` flags select
7- and 8-digit codes instead.

`mfa -list` lists the names of all the keys in the keychain.

`mfa name` prints a two-factor authentication code from the key with the
given name. If `-clip` is specified, `mfa` also copies to the code to the system
clipboard.

With no arguments, `mfa` prints two-factor authentication codes from all
known time-based keys.

The default time-based authentication codes are derived from a hash of the
key and the current time, so it is important that the system clock have at
least one-minute accuracy.

The keychain is stored unencrypted in the text file `$HOME/.mfa`.

## Example

During GitHub mfa setup, at the “Scan this barcode with your app” step,
click the “enter this text code instead” link. A window pops up showing
“your two-factor secret,” a short string of letters and digits.

Add it to mfa under the name github, typing the secret at the prompt:

    $ mfa -add github
    mfa key for github: nzxxiidbebvwk6jb
    $

Then whenever GitHub prompts for a mfa code, run mfa to obtain one:

    $ mfa github
    268346
    $

Or to type less:

    $ mfa
    268346	github
    $
