CREATE TABLE "public.Usuarios" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	CONSTRAINT "Usuarios_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Produtos" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"preco" int NOT NULL,
	"foto_principal" TEXT NOT NULL,
	"fotos_secundaria" TEXT NOT NULL,
	"id da categoria" int NOT NULL,
	CONSTRAINT "Produtos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Tamanhos" (
	"id" serial NOT NULL,
	"name" varchar(5) NOT NULL UNIQUE,
	CONSTRAINT "Tamanhos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Categorias" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL UNIQUE,
	CONSTRAINT "Categorias_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Compra/produto" (
	"id" serial NOT NULL,
	"id do usuario" int NOT NULL,
	"id do produtos" int NOT NULL,
	"id do tamanho" int NOT NULL,
	"Qtd. do produto" int NOT NULL,
	CONSTRAINT "Compra/produto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Carrinho" (
	"id" serial NOT NULL,
	"id da compra/produto" int NOT NULL,
	"Status" TEXT NOT NULL,
	"data da compra" DATE NOT NULL DEFAULT NOW(),
	"endereço de entrega" TEXT NOT NULL,
	CONSTRAINT "Carrinho_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Tamanhos disponíveis" (
	"id" serial NOT NULL,
	"id do produto" int NOT NULL,
	"id do tamanho" int NOT NULL,
	CONSTRAINT "Tamanhos disponíveis_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Produtos" ADD CONSTRAINT "Produtos_fk0" FOREIGN KEY ("id da categoria") REFERENCES "Categorias"("id");



ALTER TABLE "Compra/produto" ADD CONSTRAINT "Compra/produto_fk0" FOREIGN KEY ("id do usuario") REFERENCES "Usuarios"("id");
ALTER TABLE "Compra/produto" ADD CONSTRAINT "Compra/produto_fk1" FOREIGN KEY ("id do produtos") REFERENCES "Produtos"("id");
ALTER TABLE "Compra/produto" ADD CONSTRAINT "Compra/produto_fk2" FOREIGN KEY ("id do tamanho") REFERENCES "Tamanhos"("id");

ALTER TABLE "Carrinho" ADD CONSTRAINT "Carrinho_fk0" FOREIGN KEY ("id da compra/produto") REFERENCES "Compra/produto"("id");

ALTER TABLE "Tamanhos disponíveis" ADD CONSTRAINT "Tamanhos disponíveis_fk0" FOREIGN KEY ("id do produto") REFERENCES "Produtos"("id");
ALTER TABLE "Tamanhos disponíveis" ADD CONSTRAINT "Tamanhos disponíveis_fk1" FOREIGN KEY ("id do tamanho") REFERENCES "Tamanhos"("id");








