# DriveEase - Car Rental System

A car rental web app built with **Java Servlets, JSP and MySQL** (NetBeans project).

Customers can browse cars by brand, book them for a date range, pay by card or UPI and leave feedback.
Admins can manage brands and cars and view users, bookings, payments and feedback.

## Setup

1. **Database**: start MySQL and run the script (creates the tables plus sample cars):
   ```
   mysql -u root -p -P 3307 < database/car_rental_system.sql
   ```
2. **Connection settings**: the defaults are `jdbc:mysql://localhost:3307/car_rental_system`, user `root`, password `root`.
   To use something else, set the environment variables `DB_URL`, `DB_USER` and `DB_PASSWORD` before starting the server.
3. **Run**: open the folder in NetBeans and run it on GlassFish (or build the WAR and deploy it to Tomcat 9).
   The MySQL driver is already in `web/WEB-INF/lib`.

Admin login: `Admin` / `Password` (hard-coded in `src/java/admin_login.java`; change it before deploying).

## Project structure

| Path | What it is |
|------|------------|
| `src/java/` | Servlets that handle form submissions (`booking`, `payment`, `user_login`, ...) and `Database.java` |
| `web/*.jsp` | Pages; shared header, footer and DB helper live in `web/WEB-INF/includes/` |
| `web/style.css` | Site theme (on top of Bootstrap 5) |
| `database/car_rental_system.sql` | Database schema and sample data |
