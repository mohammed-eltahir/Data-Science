SQL Programming
 Project Phase 1


-- CREATE DATABASE BANK

use bank

-- 1.	Table: UserLogins

create table UserLogins ( UserLoginID smallint, UserLogin char(15) , UserPassword varchar(20) , constraint PK_UserLogins primary key (UserLoginID) )

Insert Into UserLogins

insert into UserLogins Values ( 1 , 'meltahir' , 'abcd' )
insert into UserLogins Values ( 2 , 'mashaiersaeed' , 'xyz' )
insert into UserLogins Values ( 3 , 'ahmed' , 'abc123')
insert into UserLogins Values ( 4 , 'amr' , 'xyz123' )
insert into UserLogins Values ( 5 , 'fatima' , 'fatima123')


-- 2.	Table: UserSecurityQuestions

create table UserSecurityQuestions (UserSecurityQuestionID tinyint , UserSecurityQuestion varchar(50) , constraint PK_UserSecurityQuestions primary key (UserSecurityQuestionID))

Insert Into UserSecurityQuestions

insert into UserSecurityQuestions values ( 1, 'What is your favarite  Car Manufacturer' )
insert into UserSecurityQuestions values ( 2, 'What is your eldest sibling name' )
insert into UserSecurityQuestions values ( 3, 'Which year you have graduced from University' )
insert into UserSecurityQuestions values ( 4, 'What is your pet name' )
insert into UserSecurityQuestions values ( 5, 'What is your  elementary school teacher' )


-- 3.	Table: SavingsInterestRates

create table SavingsInterestRates (InterestSavingsRateID tinyint , InterestRateValue Numeric (9,9) , InterestRateDescription varchar(20) constraint PK_SavingsInterestRates primary key (InterestSavingsRateID))




-- 4.	Table: AccountType

create table AccountType (AccountTypeID tinyint , AccountTypedescription varchar (30) ,
constraint PK_AccountType primary key (AccountTypeID))

-- Insert into AccountType

insert into AccountType values ( 01 , 'Chequing')
insert into AccountType values ( 02 , 'Saving')
insert into AccountType values ( 03 , 'Suduent')
insert into AccountType values ( 04 , 'Retirement')
insert into AccountType values ( 05 , 'Business')


-- 5.	Table: AccountstatusType

create table AccountstatusType (AccountstatusTypeID tinyint , Accountstatusdescription varchar (30) ,
constraint PK_AccountstatusType primary key (AccountstatusTypeID))

-- Insert Into AccountstatusType

insert into AccountstatusType values ( 1 , 'Active' )
insert into AccountstatusType values ( 2 , 'InActive' )
insert into AccountstatusType values ( 3 , 'Dormant' )
insert into AccountstatusType values ( 4 , 'Closed' )



-- 6.	Table: Loginerrorlog

create table Loginerrorlog (ErrorlogID int , ErrorTime datetime , FailedTransactionXMl XML ,
constraint PK_Loginerrorlog primary key (ErrorlogID))

--Insert Into LoginErrorLog

  insert into LoginErrorLog Values ( 4001, '2021-11-20 12:10:10',
 '<loginerrorlog>
 <errorlogid>4001</errorlogid>
 <errortime>2021-11-20 12:10:10</errortime>
  </loginerrorlog>')
  insert into LoginErrorLog Values ( 4002, '2021-11-20 12:11:10',
 '<loginerrorlog>
 <errorlogid>4002</errorlogid>
 <errortime>2021-11-20 12:11:10</errortime>
  </loginerrorlog>')
  insert into LoginErrorLog Values ( 4003, '2021-11-20 12:12:10',
 '<loginerrorlog>
 <errorlogid>4003</errorlogid>
 <errortime>2021-11-20 12:12:10</errortime>
  </loginerrorlog>')
  insert into LoginErrorLog Values ( 4004, '2021-11-20 12:13:10',
 '<loginerrorlog>
 <errorlogid>4004</errorlogid>
 <errortime>2021-11-20 12:13:10</errortime>
  </loginerrorlog>')
  insert into LoginErrorLog Values ( 4005, '2021-11-20 12:15:10',
 '<loginerrorlog>
 <errorlogid>4005</errorlogid>
 <errortime>2021-11-20 12:15:10</errortime>
  </loginerrorlog>')


-- 7.	Table FailedTransactionerrortype

 create table FailedTransactionerrortype (FailedTransactionerrortypeID tinyint , FailedTransactionDescription varchar(50),
 constraint PK_FailedTransactionerrortype primary key (FailedTransactionerrortypeID))

-- Insert Into FailedTransactionerrortype

 insert into FailedTransactionerrortype values ( 1, 'Declined - Expird Card')
 insert into FailedTransactionerrortype values ( 2, 'Declined - Insufficent Fund')
 insert into FailedTransactionerrortype values ( 3, 'Declined - Limit Exceeded')
 insert into FailedTransactionerrortype values ( 4, 'Invalid PIN - Incorrect PIN')
 insert into FailedTransactionerrortype values ( 5, 'Declined - Account does not exist')


-- 8.	Table: TransactionType

create table Transactiontype (TransactiontypeID tinyint , TransactionTypeName char(10), TransactionTypeDescription varchar(50),
 TransactionFeeAmount smallmoney ,constraint PK_Transactiontype primary key (TransactiontypeID))


-- Insert Into Transactiontype

insert into Transactiontype values ( 1,'D/R' , 'DEBIT', 0)
insert into Transactiontype values ( 2,'C/R' , 'CREIT', 0)
insert into Transactiontype values ( 3,'CDM' , 'Cash and Deposit Machine', 0)
insert into Transactiontype values ( 4,'SBT' , 'Fund Transfer', 0)
insert into Transactiontype values ( 5,'ATM' , 'Cash Withdrawal', 2)




-- 9.	Table: Employee

create table Employee (EmployeeID int, EmployeeFirstName Varchar(25), EmployeeMiddleNameInitial char(1),
 EmployeeLastName varchar(25) ,EmployeeIsManager bit ,constraint PK_Employee primary key (EmployeeID))

-- Insert Into Employee

insert into Employee values ( 1001, 'Salah' , 'M' , 'Saeed', 1 )
insert into Employee values ( 1002, 'Hashim' , 'M' , 'Saeed', 0 )
insert into Employee values ( 1003, 'Tariq' , 'M' , 'Saeed', 1 )
insert into Employee values ( 1004, 'Maha' , 'M', 'Saeed', 0 )
insert into Employee values ( 1005, 'Manal', 'M', 'Saeed', 0 )


-- 10.	Table: FailedTransactionLog

create table FailedTransactionLog ( FailedTransactionID int , FailedTransactionerrortype tinyint, FailedTransactionErrorTime datetime , FailedTransactionXML xml ,
constraint PK_FailedTransactionID primary key (FailedTransactionID),
constraint FK1_FailedTransactionLog_FailedTransactionerrortype Foreign key (FailedTransactionerrortype)
 references FailedTransactionerrortype(FailedTransactionerrortypeID))

-- Insert Into FailedTransactionLog

  insert into FailedTransactionLog values ( 2001, 2 , '2021-12-08 14:10:03' , 
 '<failedtransactionlog>
 <failedtransactionid>2001</failedtransactionid>
 <failedtransactionerrortypeid>2</failedtransactionerrortypeid>
 <failedtransactionerrortime>2021-12-08 14:10:03</failedtransactionerrortime>
 </failedtransactionlog>' )
  insert into FailedTransactionLog values ( 2002, 4 , '2021-12-09 15:10:03' , 
 '<failedtransactionlog>
 <failedtransactionid>2002</failedtransactionid>
 <failedtransactionerrortypeid>4</failedtransactionerrortypeid>
 <failedtransactionerrortime>2021-12-09 15:10:03</failedtransactionerrortime>
 </failedtransactionlog>' )

 insert into FailedTransactionLog values ( 2003, 4 , '2021-12-09 17:10:03' , '<failedtransactionlog>
 <failedtransactionid>2003</failedtransactionid>
 <failedtransactionerrortypeid>4</failedtransactionerrortypeid>
 <failedtransactionerrortime>2021-12-09 17:10:03</failedtransactionerrortime>
 </failedtransactionlog>')

 insert into FailedTransactionLog values ( 2004, 4 , '2021-12-09 19:10:03' , 
 '<failedtransactionlog>
 <failedtransactionid>2004</failedtransactionid>
 <failedtransactionerrortypeid>4</failedtransactionerrortypeid>
 <failedtransactionerrortime>2021-12-09 19:10:03</failedtransactionerrortime>
 </failedtransactionlog>')

 insert into FailedTransactionLog values ( 2005, 4 , '2021-12-09 19:18:03' , 
 '<failedtransactionlog>
 <failedtransactionid>2005</failedtransactionid>
 <failedtransactionerrortypeid>4</failedtransactionerrortypeid>
 <failedtransactionerrortime>2021-12-09 19:18:03</failedtransactionerrortime>
 </failedtransactionlog>')
11.	Table: Customer

create table Customer ( CustomerID int, CustomerAddress1 varchar(30), CustomerAddress2 varchar(30), CustomerFirstName varchar(30) , 
 CustomerMiddleInitial char(1), CustomerLastName varchar(30), City varchar(20), State char(2), ZipCode char(10), EmailAddress varchar(40),
 HomePhone char(10), CellPhone char(10), WorkPhone char(10), SSN char(9), UserLoginID smallint,
 constraint PK_CustomerID primary key (CustomerID),
 constraint FK_Customer_UserLogins Foreign key  (UserLoginID) references UserLogins(UserLoginID) )


-- Insert Into Customer

insert into Customer values ( 1 , '20 Tubman Ave', '' , 'Mohammed' , 'T' , 'Eltahir' , 'Toronto' , 'ON' , 'M5A0M8' , 'meltahir@gmail.com' , '4166706572' , '4161230777' ,'4379980019', '123456789' , 1  )
 insert into Customer values ( 2 , '20 Tubman Ave', null , 'Mashaier' , 'M' , 'Abdalla' , 'Toronto' , 'ON', 'M5A 0M8' , 'mashaiersaeed@gmail.com' , '4379980019' , '4161230777', '4379980019' , '123456777' , 2) 
 insert into Customer values ( 3 , '20 Tubman Ave', null , 'Ahmed' , 'M' , 'Mohammed' , 'Toronto' , 'ON', 'M5A 0M8' , 'ahmedmtageldeen@gmail.com' , '4371234567' , '4161230777','4379980019' , '123456789' , 3 )
 insert into Customer values ( 4 , '20 Tubman Ave', null , 'Amr' , 'M' , 'Mohammed' , 'Toronto' , 'ON', 'M5A 0M8' , 'amrmtag@gmail.com' , '4371245788' , '4161230777', '4379980019' ,'123226789' , 4 )
 insert into Customer values ( 5 , '20 Tubman Ave', null , 'Fatima' , 'M' , 'Mohammed' , 'Toronto' , 'ON', 'M5A 0M8' , 'fatima@gmail.com' , '4374523899' , '4161230777','4379980019' , '123111789' , 5 )

-- 12.	Table: Account

Create table Account( AccountID int, CurrentBalance int, AccountTypeID tinyint, AccountStatusTypeID tinyint, InterestSavingsRateID tinyint,
 constraint PK_AccountID primary key (AccountID),
 constraint FK_Account_AccontType Foreign key (AccountTypeID) references AccountType(AccountTypeID),
 constraint FK_Account_AccountStatusType Foreign key (AccountStatusTypeID) references AccountStatusType(AccountStatusTypeID),
 constraint FK_Account_SavingsInterestRates Foreign key (InterestSavingsRateID) references SavingsInterestRates(InterestSavingsRateID) )

-- Insert Into Account

insert into Account values ( 10113000, 5350.35, 1 , 1, null )
insert into Account values ( 10113001, 35366.26, 1 , 1, null )
insert into Account values ( 10113002, 600.00, 3 , 1, 5 )
insert into Account values ( 10113003, 600.00, 3 , 1, 5 )
insert into Account values ( 10113004, 600.00, 3 , 1, 5 )



-- 13.	Table: LoginAccount

create table LoginAccount ( UserLoginID smallint, AccountID int,
  constraint FK1_LoginAccount_UserLogins Foreign key (UserLoginID) references UserLogins(UserLoginID),
  constraint FK2_LoginAccount_Account Foreign key (AccountID) references Account(AccountID) )

-- Insert IntoLoginAccount

insert into LoginAccount Values ( 1, 10113000 )
insert into LoginAccount Values ( 2, 10113001 )
insert into LoginAccount Values ( 3, 10113002 )
insert into LoginAccount Values ( 4, 10113003 )
insert into LoginAccount Values ( 5, 10113004 )
create table CustomerAccount ( AccountID int, customerID int)

-- 14.	Table: CustomerAccount
  
constraint FK1_CustomerAccount_Account Foreign key (AccountID) references Account(AccountID),
  constraint FK2_CustomerAccount_Customer Foreign key (CustomerID) references Customer(CustomerID) )

-- Insert into CustomerAccount

insert into CustomerAccount Values ( 10113000, 1 )
insert into CustomerAccount Values ( 10113001, 2 )
insert into CustomerAccount Values ( 10113002, 3 )
insert into CustomerAccount Values ( 10113003, 4 )
insert into CustomerAccount Values ( 10113004, 5 )

-- 15.	Table: UserSecurityAnswers

  Create Table UserSecurityAnswers ( UserLoginID smallint, UserSecurityAnswer varchar(25),UserSecurityQuestionID tinyint,
  constraint PK_UserSecurityAnswers primary key (UserLoginID),
  constraint FK2_UserSecurityAnswer_UserLogins foreign key (UserLoginID) references UserLogins(UserLoginID),
  constraint FK4_UserSecurityAnswer_UserSecurityQuestions foreign key (UserSecurityQuestionID) references UserSecurityQuestions(UserSecurityQuestionID) )

-- Insert Into UserSecurityAnswers

 insert into UserSecurityAnswers values ( 1, 'nissan' , 1)
 insert into UserSecurityAnswers values ( 2, '1998' , 3)
 insert into UserSecurityAnswers values ( 3, 'john' , 5)
 insert into UserSecurityAnswers values ( 4, 'ahmed' , 2)
 insert into UserSecurityAnswers values ( 5, 'cat' , 4)




-- 16.	Table: OverDraftLog

  Create table OverDraftLog (AccountID int, OverDraftDate datetime, OverDraftAmount money, OverDraftTransactionXML xml,
  constraint PK_OverDraftLog_AccountID primary key (AccountID),
  constraint FK_OverDraftLog_AccountID foreign key ( AccountID) references Account(AccountID) )

-- Insert Into OverDraftLog

 insert into OverDraftLog values ( 10113000, '2021-11-24 00:38:54', 1000,
 '<overdraftlog> <accountid>10113000 </accountid> <overdraftdate> 2021-11-24 00:38:54 </overdraftdate> <overdraftamount> 1000 </overdraftamount>  </overdraftlog>' )

  insert into OverDraftLog values ( 10113001, '2021-12-03 10:39:59', 500,
 '<overdraftlog> <accountid>10113001 </accountid> <overdraftdate> 2021-12-03 10:39:59 </overdraftdate> <overdraftamount> 500 </overdraftamount>  </overdraftlog>' )

 insert into OverDraftLog values ( 10113002, '2021-12-01 00:10:33', 100,
 '<overdraftlog> <accountid>10113002 </accountid> <overdraftdate> 2021-12-01 00:10:33 </overdraftdate> <overdraftamount> 100 </overdraftamount>  </overdraftlog>' )

  insert into OverDraftLog values ( 10113003, '2021-12-01 00:10:34', 100,
 '<overdraftlog> <accountid>10113003 </accountid> <overdraftdate> 2021-12-01 00:10:34 </overdraftdate> <overdraftamount> 100 </overdraftamount>  </overdraftlog>' )

  insert into OverDraftLog values ( 10113004, '2021-12-01 00:10:53', 100,
 '<overdraftlog> <accountid>10113004 </accountid> <overdraftdate> 2021-12-01 00:10:53 </overdraftdate> <overdraftamount> 100 </overdraftamount>  </overdraftlog>' )


-- 17.	Table: TransactionLog

Create table TransactionLog ( TransactionID int, TransactionDate datetime, TransactionTypeID tinyint, TransactionAmount money,
  NewBalance money, AccountID int, CustomerID int, EmployeeID int, UserLoginID smallint,
  constraint FK7_TransactionLog_TransactionType foreign key (TransactionTypeID) references TransactionType(TransactionTypeID),
  constraint FK6_TransactionLog_Account foreign key (AccountID) references Account(AccountID),
  constraint FK3_TransactionLog_Customer foreign key (CustomerID) references Customer(CustomerID),
  constraint FK4_TransactionLog_Employee foreign key (EmployeeID) references Employee(EmployeeID),
  constraint FK5_TransactionLog_UserLogins foreign key (UserLoginID) references UserLogins(UserLoginID) )

-- Insert Into TransactionLog

insert into TransactionLog values ( 6001, '2021-12-10 11:10:40', 2 , 300, 5350, 10113000, 1, 1003, 1 )
insert into TransactionLog values ( 6002, '2021-12-10 11:12:40', 2 , 5000, 35366, 10113001, 2, 1003, 2 )
insert into TransactionLog values ( 6003, '2021-12-10 11:13:40', 2 , 100, 600, 10113002, 3, 1004, 3 )
insert into TransactionLog values ( 6004, '2021-12-10 11:14:40', 2 , 100, 600, 10113003, 4, 1004, 4 )
insert into TransactionLog values ( 6005, '2021-12-10 11:15:40', 2 , 100, 600, 10113004, 5, 1004, 5 )

