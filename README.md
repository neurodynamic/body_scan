A way for your Mac to direct you in a guided body scan meditation.

Run with `ruby body_scan.rb`

To customize how long the meditation will last, pass the script a number of minutes.

E.g. for a 30-minute body scan, run with `ruby body_scan.rb 30`

The program will adjust the time between instructions to be faster or slower accordingly.

To customize by the length of breaks between each instruction instead, pass the scrips a number of seconds followed by an "s".

E.g. for 15 seconds between each instruction, run with `ruby body_scan.rb 15s`

To run the scan from the top of your body to the bottom, pass the word "top" as an argument.

E.g. `ruby body_scan.rb top`

Arguments can be combined (in any order), e.g. to run a 30 minute top-to-bottom meditation, run with `ruby body_scan.rb 30 top`