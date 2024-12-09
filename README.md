# Advanced Database System Implementation - Car Dealership

This project demonstrates the design and implementation of a hybrid database system for a car dealership, based on the **Advanced Databases** module. The database is built using SQL Server (SSMS) and includes tables, triggers, views, stored procedures, and XML operations as per the assignment requirements.

## Database Overview

The database contains the following main components:
- **Customers**: Information about customers who purchase cars.
- **Cars**: Information about available cars, including specifications stored in XML format.
- **Sales**: Records of sales made to customers, including car details and sale amount.
- **Employees**: Information about employees working at the dealership.
- **Suppliers**: Information about car suppliers.
- **SalesLog**: A log to track each sale made.

The system supports:
- Data manipulation through **triggers**.
- **Views** for generating customized data.
- **Stored Procedures** to retrieve and manipulate data with parameters.
- **XML Data Type** to store and manage car specifications.

## Requirements

- **SQL Server Management Studio (SSMS)** or another compatible SQL tool.
- SQL Server 2017 or later (for XML data type and advanced SQL features).
  
## Features

### 1. **Database Creation**
The project starts by creating the database `CarDealershipDB` using the `CREATE DATABASE` SQL command.

### 2. **Table Design**
Five main tables are created:
- `Customers`
- `Cars`
- `Sales`
- `Employees`
- `Suppliers`
Additionally, a `SalesLog` table is created to log sales activities.

### 3. **Triggers**
Two triggers are implemented:
- **PreventCarDeletion**: Prevents deletion of cars that are associated with sales.
- **LogSales**: Logs every sale made into the `SalesLog` table.

### 4. **Views**
Two views are created:
- **CarSalesSummary**: Provides a summary of car sales, including the total sales and total revenue by car model.
- **PremiumCustomers**: Lists customers who have made high-value purchases (greater than 50,000).

### 5. **Stored Procedures**
A stored procedure `GetCustomerSales` is created to retrieve all sales made by a specific customer.

### 6. **XML Operations**
- **Insert**: Cars are added to the database with XML-formatted specifications.
- **Query**: Queries are made to retrieve XML data, specifically the color of the car.
- **Modify**: The color of a car is updated in the XML field using the `modify()` function.
- **Search**: A search is performed to find cars with a specific color in the XML field.

## Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/car-dealership-database.git
