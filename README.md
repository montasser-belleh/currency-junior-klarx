# currency-junior-klarx
My solution to the internships challenge propsed by Klarx.

1. Setup the database connection
2. The API access key is used in two files :
  * app/models/api.rb
  * spec/example_spec.rb
 If the API is expired or you want to use your own API, please make sure to update
 the value of the access key in those two files.
 3. To add new currencies, just add the abbreviation in the app/controllers/currencies_controller.rb
 file, an example is already commented out (the CAD).
 4. Tests are written in the spec/example_spec.rb file, I did a few conversion tests and simple views tests.
 5. I added logging to the application, the log folder contains a few logs, used the 'logger' gem.
 6. For the front-end design, I used Materialize the CSS framework based on Material Design by Google.
 7. I included my 'currencydb' used while testing and developing the application in .csv format, exported it from
 postgres.
 8. I included a few screenshots of the application running in the 'screenshots' folder.
