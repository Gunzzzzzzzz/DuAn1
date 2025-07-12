-- Tạo CSDL
CREATE DATABASE quanly_Jollibee;
GO
USE quanly_Jollibee;
GO

-- Bảng Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100),
    email NVARCHAR(100),
    phone NVARCHAR(20),
    address NVARCHAR(255),
    created_at DATETIME
);


-- Bảng Admins
CREATE TABLE Admins (
    admin_id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(100),
    password NVARCHAR(100),
    role NVARCHAR(50),
    created_at DATETIME
);


-- Bảng Categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100),
    description NVARCHAR(MAX)
);

-- Bảng Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100),
    description NVARCHAR(MAX),
    price DECIMAL(10, 2),
    image_url NVARCHAR(255),
    category_id INT FOREIGN KEY REFERENCES Categories(category_id)
);

-- Bảng Vouchers
CREATE TABLE Vouchers (
    voucher_id INT PRIMARY KEY IDENTITY(1,1),
    code NVARCHAR(50),
    discount_percent DECIMAL(5, 2),
    expiry_date DATE
);

-- Bảng Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT FOREIGN KEY REFERENCES Users(user_id),
    voucher_id INT FOREIGN KEY REFERENCES Vouchers(voucher_id),
    order_date DATETIME,
    status NVARCHAR(50)
);

-- Bảng OrderDetails
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Bảng Feedbacks
CREATE TABLE Feedbacks (
    feedback_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT FOREIGN KEY REFERENCES Users(user_id),
    product_id INT FOREIGN KEY REFERENCES Products(product_id),
    rating INT,
    comment NVARCHAR(MAX),
    created_at DATETIME
);