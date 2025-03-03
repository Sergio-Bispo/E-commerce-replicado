-- criação do banco de dados para o cenário de E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
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
-- desc clients;
-- criar tabela produto
-- size ddimensão do produto 
create table product(
   idProduct int auto_increment primary key,
   Pname varchar (10) not null,
   classification_kids boolean default false,
   category enum ('Eletrônico', 'Confecção', 'Brinquedo', 'Alimentos', 'Móveis') not null,
   Avaliação float default 0,
   size varchar (10)
);
-- desc product;
-- para continuar o desafio: termine de implemantar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional
-- criar constraints relacionadas ao pagamento 
create table payments(
idclient int,
idPayment int,
typePayment enum ('Boleto', 'Pix', 'Cartão', 'dois Cartões'),
limitAvailable float,
primary key (idClient, IdPayment)


);
-- desc payments;
-- criar tabela pedido


create table orders(
   idOrder int auto_increment primary key,
   idOrderClient int,
   orderStatus enum ('Cancelado', 'Confirmado', 'Em processamento', 'Entregue') default 'Em processamento',
   orderDescription varchar (255),
   sendValue  float default 10,
   paymentCash bool default false,
   constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
           on update cascade
           
   
   );
   
   desc orders;
   
   -- tabela estoque
   
   create table productStorage(
   idProdStorage int auto_increment primary key,
   storageLacation varchar (255),
   Quantity int default 0
      
   );
   -- desc productStorage;
   
  -- tabela fornecedor 
   create table supplier (
   idSupplier int auto_increment primary key,
   SocialName varchar (255),
   CNPJ char (15) not null,
   contact char (11) not null,
   constraint unique_supplier unique (CNPJ)
   
   );
  -- desc supplier;
   
   -- tabela vendedor
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
  desc seller;
   
   -- Produto vendedor
   
   create table productSeller (
   idPseller int,
   idPproduct int,
   prodQuantity int default 1,
   primary key (idPseller, idPproduct),
   constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
   constraint fk_product_product foreign key (idPproduct) references product(idProduct)
   );
   desc productSeller;
   
   create table productOrder(
   idPOproduct int,
   idPOorder int,
   poQuantity int default 1,
   poStatus enum ('Disponível', 'Sem estoque') default 'Disponível',
   primary key (idPOproduct, idPOorder),
   constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
   constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
       
  );
   
  -- desc productOrder;
   
  create table storageLocation (
   idLproduct int,
   idLstorage int,
   location varchar (255) not null,
   primary key (idLproduct, idLstorage),
   constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
   constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idprodStorage)
 );
-- desc storageLocation;

show tables;

create table productSupplier (
idPsSupplier int,
idPsProduct int,
quantity int not null,
primary key (idPsSupplier, idPsProduct),
constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);
  -- desc productSupplier; 
  
  show databases; 
  use information_schema;
  show tables;
  desc referential_constraints;
  select * from referential_constraints where constraint_schema = 'ecommerce';

   