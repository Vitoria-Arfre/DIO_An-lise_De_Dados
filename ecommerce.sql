-- criação do banco de dados para o cenário do E-commerce

create database ecommerce;

-- criar tabela cliente
create table cliente(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Adress varchar(45),
    constraint unique_cpf_client unique (CPF)
   
    
);

desc client;

-- criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10),
    Classificatio_kids bool default false,
    category enum("eletronico","Vestimenta","Brinquedos","Alimentos","Móveis"),
    avaliacao float default 0,
    size varchar(10),    
    constraint unique_cpf_client unique (CPF)
       
);
-- criar tabela de pagamentos-- 
-- termine de implementar a tabela e crie a conexão com as tabelas necesárias e reflita essa modificação no diagrama de esquema relacional
-- criar constraints relacionadas ao pagamento

create table payments(
	idclient int,
    id_payment int,
    typePayment enum("Boleto","Cartão","Dois cartões"),
    limitAvailable float,
    primary key(idClient, id_payment)
);

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    ordersStatus enum("Cancelado", "Confirmado","Em processamento") default "Em processamento",
    ordersDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
    
);

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantify int default 0
     
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null, 
    constraint unique_supplier unique (CNPJ)
);


-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    location varchar(255),
    CNPJ char(15) not null,
    CPF char(9) not null,
    contact char(11) not null, 
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantify int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idPproduct )
    

);

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantify int default 1,
    postatus enum("Disponivel","Sem estoque") default "Disponivel",
    primary key (idPOproduct, idPOorder),
    constraint fk_product_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_product_product foreign key (idPOorder) references product(idOrder)
    
);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_product_seller foreign key (idLproduct) references product(idProduct),
    constraint fk_product_product foreign key (idLstorage) references product(productSeller)

);

