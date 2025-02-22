use desafio_ecommerce;

show tables;

-- idClient, Fname, Minit, Lname, CPF, Date, Address
select * from clients;
insert into clients (Fname, Minit, Lname, CPF, Data_Nascimento, Address)
	 values ('Maria','M','Silva',12345678900,'1990-08-27','rua Bonfim 01'),
            ('Marli','M','Silva',12923456789,'1990-08-27','rua Bonfim 01'),
            ('Mateus','O','Pimentel',987654321,'1992-07-10','rua Alameida'),
            ('Ricardo','F','Silva',456789132,'1989-05-15','rua Vinhaes'),
            ('Julia', 'S','França',789123456,'1960-01-18', 'Avenida Sete'),
            ('Roberta','G','Assis',987456731,'1965-09-20', 'rua Bahia'),
            ('Isabela','M','Cruz',654345889,'1988-09-27','rua das Flores');
            
-- idProducts, Pname, classification_Kyds boolean, category('Eletrônivo','Vestimenta','Brinquedos','Alimentos','Móveis')avaliação, size
select * from product;
insert into product (Pname, classification_Kids, category, avaliação, size) values
                     ('Fone',false,'Eletrônico','4',null),
                     ('Barbie',true,'Brinquedo','3',null),
                     ('Body',true,'Confecção','2',null),
                     ('Microfone',False,'Eletrônico','4',null),
                     ('Sofá',false,'Móveis','3','3x57x80');
 select * from orders;                    
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
             values (1, default, 'compra via aplicativo',null,1),
                    (2, default, 'compra via aplicativo', 50,0),
                    (3, 'Confirmado',null,null,1),
                    (4,default, 'compra via web site', 150,0);
                    
-- idPOproduct, idPOorder, poQuantity, poStatus
select * from productOrder;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
                         (1,1,2,null),
                         (2,1,1,null),
                         (3,2,1,null);
                         
                         -- storageLocation, Quantity
select * from productStorage;
insert into productStorage (storageLacation, Quantity) values
                          ('Rio de Janeiro', 1000),
                          ('Rio de Janeiro', 500),
                          ('São Paulo', 10),
                          ('São Paulo', 20),
                          ('Brasília', 50),
                          ('São Paulo', 100);
                          
-- idLproduct, idLstorage, location
select * from storageLocation;
insert into storageLocation (idLproduct, idLstorage, location) values
                            (1,2, 'RJ'),
                            (3,4, 'SP');
                            
-- idSupplier, SocialName, CNPJ, contact
select * from supplier;
insert into supplier (SocialName, CNPJ, contact) values
                     ('Almeida Filho', 123456789123456, '987653219'),
                     ('Eletrônicos Silva', 246801357987654, '912347895'),
                     ('Eletrônicos Valmar', 867956432319856, '959073425');
                     
                     -- idPsSupplier, idPsProduct, quantity
select * from productSupplier;
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
                            (1,1,500),
                            (1,2,400),
                            (2,4,633),
                            (3,3,5),
                            (2,5,10);
                            
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
select * from seller;
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
                   ('Tech Eletronics', null, 123654789107689, null,'Bahia', '123456789'),  
                   ('Boutique Durgas', null,null, 98765432123, 'Rio de Janeiro','135790827'),
                   ('Kids World', null, 456987123246973,null, 'São Paulo', '11987563423');
                   
-- idPseller, idPproduct, prodQuantity
select * from productSeller;

insert into productSeller (idPseller, idPproduct, prodQuantity) values
                          (1,6,80),
                          (2,7,10);
                          
                          
                          
-- Quais são os dados completos dos clientes e fornecedores?
 select * from clients c, orders o  where c.idClient = idOrderClient;
 select concat(SocialName,' ', contact,' ',location ) as complete_name from seller;
 
 -- idPsPayment, idPsProduct, price, quantity
 select * from paymentProduct;
 insert into paymentProduct (idPsPayment, idPsProduct, price, quantity) values
                      ('1', '2', '2000','2'),
                      ('10', '7', '5000', '8');
                     
                      
					
 use desafio_ecommerce_constraints;
show tables;    
-- Recupeando nomes completos dos clients
select concat(Fname,' ', Minit,' ',Lname ) as complete_name from Clients;
 --  STATEMENT                
-- Queries Case statement, Recuperando dados de clientes
 select Fname, data_nascimento, Address from clients;
 select Price, quantity from paymentProduct;
 
 -- funções e cláusulas de agrupamento
 
 -- Pesquisar quantidade de clientes e pedidos
 select * from orders;
select count(*) from orders;

-- Recuperar Lname, Data de Nacimento, Address e pedidos dos clientes       
select c.idClient, Lname, Data_nascimento, Address, count(*) as Number_of_orders from clients c
                               inner join orders o ON c.idClient = o.idOrderClient
                               group by idClient;
                          
-- ORDER BAY
select CNPJ, contact, SocialName from supplier order by (SocialName); 

-- AGRUPAMENTO
select count(*) from Clients;

-- GROUP BAY E HAVING
select SocialName, count(*)
 from seller
 where CNPJ > 10
 group by SocialName
 having count(*) >=0;
 
 -- JUNÇÃO DE TABELAS
 
 select AbstName, location, count(*)
     from supplier, seller
     where CPF = CPF
     group by location, AbstName;
    
    
  


     