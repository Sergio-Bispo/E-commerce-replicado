-- inseção de dados e Queries
use ecommerce;

show tables;

-- idClient, Fname, Minit, Lname, CPF, Date, Address

insert into clients (Fname, Minit, Lname, CPF, Data_Nascimento, Address)
	 values ('Maria','M','Silva',12345678900,'1990-08-27','rua Bonfim 01'),
            ('Marli','M','Silva',12923456789,'1990-08-27','rua Bonfim 01'),
            ('Mateus','O','Pimentel',987654321,'1992-07-10','rua Alameida'),
            ('Ricardo','F','Silva',456789132,'1989-05-15','rua Vinhaes'),
            ('Julia', 'S','França',789123456,'1960-01-18', 'Avenida Sete'),
            ('Roberta','G','Assis',987456731,'1965-09-20', 'rua Bahia'),
            ('Isabela','M','Cruz',654345889,'1988-09-27','rua das Flores');
            
  
-- idProducts, Pname, classification_Kyds boolean, category('Eletrônivo','Vestimenta','Brinquedos','Alimentos','Móveis')avaliação, size
insert into product (Pname, classification_Kids, category, avaliação, size) values
                     ('Fone',false,'Eletrônico','4',null),
                     ('Barbie',true,'Brinquedo','3',null),
                     ('Body',true,'Confecção','2',null),
                     ('Microfone',False,'Eletrônico','4',null),
                     ('Sofá',false,'Móveis','3','3x57x80');
select * from clients;
select * from product;
select * from orders;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

delete from orders where idOrderClient in (1,2,3,4);

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
             values (1, default, 'compra via aplicativo',null,1),
                    (2, default, 'compra via aplicativo', 50,0),
                    (3, 'Confirmado',null,null,1),
                    (4,default, 'compra via web site', 150,0);
                    
                                        
 select * from productOrder;                   
-- idPOproduct, idPOorder, poQuantity, poStatus
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
                         (1,1,2,null),
                         (2,1,1,null),
                         (3,2,1,null);
                         
 select * from productOrder;     
 
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
                   
-- idPseller, idProduct, prodQuantity
select * from productseller;
insert into productSeller(idPseller, idProduct, prodQuantity) values
                          (1,6,80),
                          (2,7,10);
                          
select count(*) from clients;                                       
select * from clients c, orders o where c.idClient = idOrderClient;   

select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;   
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values                                
                    (2, default, 'compra via aplicativo',null, 1); 
	
select count(*) from clients c, orders o
         where c.idClient = idOrderClient
         group by idOrder;
         
select * from clients left outer join orders  ON idClient = idOrderClient;         
         
         select * from clients c inner join orders o ON c.idClient = o.idOrderClient
                               inner join productOrder p on p.idPOorder = o.idOrder;

-- Recuperação de pedido com produto associado 
select * from clients c   
                  inner join orders o ON c.idClient = o.idOrderClient
                  inner join productOrder p on p.idPOorder = o.idOrder
			group by idClient;
                  
                  
-- Recuperar quantos pedidos foram realizados pelos clientes                               
select c.idClient, Fname, count(*) as Number_of_orders from clients c
                               inner join orders o ON c.idClient = o.idOrderClient
                               group by idClient;