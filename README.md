# Rales Engine

Rales Engine utilizes the Ruby on Rails framework and [Fast JSON API](https://github.com/Netflix/fast_jsonapi) gem to expose data via a web-based API. The application loads, parses, searches and executes business intelligence queries against generated sales data.

## Local Installation

- clone down the repository: `$ git clone https://github.com/freeheeling/rales_engine.git`
- change into directory: `$ cd rales_engine`
- run bundler: `$ bundle intsall`
- prepare the database: `$ rake db:{create,migrate}` 
- then: 
  ```
  $ rake import:merchants
  $ rake import:customers
  $ rake import:invoices
  $ rake import:transactions
  $ rake import:items
  $ rake import:invoice_items
  ```
- initialize Rails server: `$ rails s`
- open browser, and visit: `http://localhost:3000`, which serves as the domain for all resource endpoints

## Database Composition

The Rales Engine database is comprised of six resource types – Merchants, Customers, Invoices, Items, Transactions and Invoice Items – each of whose attributes and assoications are depicted by the following Active Designer-generated schema.

![schema](https://user-images.githubusercontent.com/50811220/69841424-f4192f00-1256-11ea-8f62-e353af4d2d55.png)

## Endpoints

Data for all Record, Relationship and Business Intelligence endpoints are exposed under an `api` and version (`v1`) namespace (e.g., `/api/v1/merchants`), returned in JSON format. Available resource types include: merchants, customers, invoices, items, transactions and invoice_items.

### Record Endpoints

These include direct queries against single resources, the results of which are presented as a list of record objects. 

- **Index:** `GET /api/v1/<resource>` renders all corresponding records 

- **Show:** `GET /api/v1/<resource>/:id` renders a single corresponding record

- **Single Finder:** `GET /api/v1/<resource>/find?parameters` returns a single record matching the specified parameter

- **Multi-Finder:** `GET /api/v1/<resource>/find_all?parameters` returns all records matching the specified parameter

- **Random:** `GET /api/v1/<resource>/random` returns a random record

#### Query Parameters

The following attribute parameters for `find` and `find_all` may be filtered within the respective resources, adhering to the query string format `?parameter=value` (e.g., `/api/v1/merchants/find?id=1`):

- **Merchants:** id, name, created_at, updated_at
- **Customers:** id, first_name, created_at, updated_at
- **Invoices:** id, status, customer_id, merchant_id, created_at, updated_at
- **Items:** id, name, description, unit_price, merchant_id, created_at, updated_at
- **Transactions**: id, credit_card_number, result, invoice_id, created_at, updated_at
- **Invoice Items:** id, quantity, unit_price, item_id, invoice_id, created_at, updated_at

### Relationship Endpoints

Associations between a given record and the resources to which it is connected are exposed via the following endpoints: 

#### Merchants
```
GET /api/v1/merchants/:id/items     # returns a collection of items associated with that merchant
GET /api/v1/merchants/:id/invoices  # returns a collection of invoices associated with that merchant from their known orders
```
#### Invoices
```
GET /api/v1/invoices/:id/transactions  # returns a collection of associated transactions
GET /api/v1/invoices/:id/invoice_items # returns a collection of associated invoice items
GET /api/v1/invoices/:id/items         # returns a collection of associated items
GET /api/v1/invoices/:id/customer      # returns the associated customer
GET /api/v1/invoices/:id/merchant      # returns the associated merchant
```
#### Invoice Items
```
GET /api/v1/invoice_items/:id/invoice  # returns the associated invoice
GET /api/v1/invoice_items/:id/item     # returns the associated item
```
#### Items
```
GET /api/v1/items/:id/invoice_items  # returns a collection of associated invoice items
GET /api/v1/items/:id/merchant       # returns the associated merchant
```
#### Transactions
```
GET /api/v1/transactions/:id/invoice  # returns the associated invoice
```
#### Customers
```
GET /api/v1/customers/:id/invoices      # returns a collection of associated invoices
GET /api/v1/customers/:id/transactions  # returns a collection of associated transactions
```
### Business Intelligence Endpoints

ActiveRecord and SQL are utilized to expose these more complex data queries:

#### All Merchants
```
GET /api/v1/merchants/most_revenue?quantity=x  # returns the top `x` merchants ranked by total revenue
GET /api/v1/merchants/revenue?date=x           # returns the total revenue for date `x` across all merchants
```
#### Single Merchant
```
GET /api/v1/merchants/:id/favorite_customer  # returns the customer who has conducted the most successful transactions
```
#### Items
```
GET /api/v1/items/most_revenue?quantity=x  # returns the top `x` items ranked by total revenue generated
GET /api/v1/items/:id/best_day             # returns the date with the most sales for a given item
```
#### Customers
```
GET /api/v1/customers/:id/favorite_merchant  # returns the merchant for which a given customer has conducted the most successful transactions
```
