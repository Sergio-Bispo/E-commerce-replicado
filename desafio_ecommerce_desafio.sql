-- Desafio E-commerce  
-- drop database desafio_ecommerce;
create database desafio_ecommerce;
use desafio_ecommerce;

create table clients(
   idClient int auto_increment primary key,
   Fname varchar (10),
   Minit varchar (3),
   Lname varchar (20),
   CPF char(11) not null,
   Data_Nascimento Date not null,
   Address varchar (30),
   constraint unique_cpf_client unique (CPF)
      
   );
   alter table clients auto_increment=1;
   
create table product(
	idProduct int auto_increment primary key,
	Pname varchar (10) not null,
	classification_kids boolean default false,
	category enum ('Eletrônico', 'Confecção', 'Brinquedo', 'Alimentos', 'Móveis') not null,
	Avaliação float default 0,
    size varchar (10)
   );
   
create table payments(
	 idclient int,
	 idPayment int,
	 typePayment enum ('Cartão de crédito', 'Pix', 'Boleto', 'Dois Cartões de créditos', 'Cartão de débito'),
     Data_Pagamento  date not null,
     CPF char (11) not null,
     CNPJ char (15) not null,
     contact char (11) not null,
	 limitAvailable float,
	 constraint unique_cnpj_payments unique (CNPJ),
     constraint unique_cpf_payments unique (CPF)
     
  );

create table orders(
	idOrder int auto_increment primary key,
	idOrderClient int,
	orderStatus enum ('Cancelado', 'Confirmado', 'Em processamento', 'Entregue') default 'Em processamento',
	orderDescription varchar (255),
	sendValue  float default 10,
	paymentCash boolean default false,
	constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
           on update cascade
         
	);
    
create table productStorage(
   idProdStorage int auto_increment primary key,
   storageLacation varchar (255),
   Quantity int default 0
      
   );
   
create table supplier (
   idSupplier int auto_increment primary key,
   SocialName varchar (255),
   CNPJ char (15) not null,
   contact char (11) not null,
   constraint unique_supplier unique (CNPJ)
   
   );
   
create table seller (  
   idSeller int auto_increment primary key,
   SocialName varchar (255),
   AbstName varchar (255),
   CNPJ char (15),
   CPF char (11),
   location varchar (255),
   contact char (11) not null,
   constraint unique_cnpj_seller unique (CNPJ),
   constraint unique_cpf_seller unique (CPF)
   );
   
 create table productSeller (
   idPseller int,
   idPproduct int,
   prodQuantity int default 1,
   primary key (idPseller, idPproduct),
   constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
   constraint fk_product_product foreign key (idPproduct) references product(idProduct)
   );
   
create table productOrder(
   idPOproduct int,
   idPOorder int,
   poQuantity int default 1,
   poStatus enum ('Disponível', 'Sem estoque') default 'Disponível',
   primary key (idPOproduct, idPOorder),
   constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
   constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
       
  );
  
create table storageLocation (
   idLproduct int,
   idLstorage int,
   location varchar (255) not null,
   primary key (idLproduct, idLstorage),
   constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
   constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idprodStorage)
   
   );
 
create table productSupplier (
	idPsSupplier int,
	idPsProduct int,
	quantity int not null,
	primary key (idPsSupplier, idPsProduct),
	constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
	constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
); 

 create table PaymentProduct (
   idPsPayment int,
   idPsProduct int,
   price float not null,
   quantity int not null,
  -- primary key (idPsPayment, idPsProduct),
 --  constraint fk_payment_Product foreign key (idPsProduct) references product(idProduct),
  -- constraint fk_payment_paynent foreign key (idPsPayment) references payments(idPayment)
  constraint unique_price_payments unique (price),
  constraint unique_quantity_payments unique (quantity)
     );
show tables;
desc table_constraints;
show databases;
use information_schema;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'desafio_ecommerce';

