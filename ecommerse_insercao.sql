-- inse~ção de dados e queries

use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into cliente (Fname, Minit, Lname, CPF, Address)
	values('Maria', 'M', 'Silva', 123456789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		  ('Matheus', 'O', 'Pimentel', 987654321, 'rua alemeda 289, Centro - Cidade das flores'),
          ('Ricardo', 'F', 'Silva', 45678913, 'avenida alameda vinha 1009, Centro - Cidade das flores'),
          ('Julia', 'S', 'França', 789123456, 'rua lareijeiras 861, Central- Cidade das flores'),
          ('Roberta', 'G', 'Silva', 987456321, 'avenidade koller 19, Centro - Cidade das flores'),
          ('Isabela', 'M', 'Cruz', 654789123, 'rua alameda das flores 28, Centro - Cidade das flores');

-- idProduct, Pname, classification_kids boolean, category('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') avaliação, size          
insert into product (Pname, classification_kids, category, avaliação, size) values
							('Fone de ouvido', false, 'Eletrônico','4', null),
                            ('Barbie Elsa', true, 'Brinquedos','3', null),
                            ('Body Carters', true, 'Vestimenta','5', null),
                            ('Microfone Vedo - Youtuber', false, 'Eletrônico','4', null),
                            ('Sofá retrátil', false, 'Móveis','3', '3x57x80'),
                            ('Farinha de arroz', false, 'Alimentos','2', null),
                            ('Fire Stick Amazon', false, 'Eletrônico','3', null);
                            
select * from clients;
select * from product;
                            
-- idOrder, idOrderClient, orderStatus, orderDescription, senValue, paymentCash
delete from orders where idOrderclient in (1,2,3,4);

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
			(1, default, 'compra via aplicativo', null,1),
            (2, default, 'compra via aplicativo', 50,0),
            (3, 'Confirmado', null, null,1),
            (4, default, 'compra via web site', 150,0);
            
            
            
-- idPOproduct, idPOorder, poQuantify, poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantify, poStatus) values
			(1,5,2,null),
            (2,5,1,null),
            (3,6,1,null);
            
-- storageLocation, quantify
insert into productStorage (storageLocation, quantify) values
							('Rio de Janeiro', 1000),
                            ('Rio de Janeiro', 500),
                            ('São Paullo', 10),
                            ('São Paullo', 100),
                            ('São Paullo', 10),
                            ('Brasília', 60);
                            
-- idLproduct, idLstorage, location                            
insert into storageLocation (idLproduct, idLstorage, location) values
							(1,2,'RJ'),
                            (2,6,'GO');
                            
-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
					('Almeida e filhos', 1234567899123456, '21985474'),
                    ('Eletrônicos Silva', 854519649143457, '21985484'),
                    ('Eletrônicos Valma', 934567893934695, '21975474');

-- idPsSupplier, idPsProduct, quantify                    
insert into productSupplier (idPsSupplier, idPsProduct, quantify) values
							(1,1,500),
                            (1,2,400),
                            (2,4,633),
                            (3,3,5),
                            (2,5,10);
                            
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
					('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
                    ('Botique Durgas' ,null,null, 125456783455341 , 'Rio de Janeiro', 219946295),
                    ('Kids World', null, 123456787959325, null, 'São Paulo', 219945387);
                    
 
insert into productSeller (idPseller, idPproduct, prodQuantify) values
					(1,6,80),
                    (2,7,10);
