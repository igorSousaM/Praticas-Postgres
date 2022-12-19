CREATE TABLE "public.usuarios" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	CONSTRAINT "usuarios_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.produtos" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"preco" int NOT NULL,
	"foto_principal" TEXT NOT NULL,
	"fotos_secundaria" TEXT NOT NULL,
	"id_categoria" int NOT NULL,
	CONSTRAINT "produtos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.tamanhos" (
	"id" serial NOT NULL,
	"name" varchar(5) NOT NULL UNIQUE,
	CONSTRAINT "tamanhos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categorias" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL UNIQUE,
	CONSTRAINT "categorias_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.compra_por_produto" (
	"id" serial NOT NULL,
	"id_usuario" int NOT NULL,
	"id_produto" int NOT NULL,
	"id_tamanho" int NOT NULL,
	"qtd_produto" int NOT NULL,
	CONSTRAINT "compra_por_produto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.carrinho" (
	"id" serial NOT NULL,
	"id_compra_por_produto" int NOT NULL,
	"status" TEXT NOT NULL DEFAULT 'criada',
	"data_compra" DATE NOT NULL DEFAULT NOW(),
	"endereço_entrega" TEXT NOT NULL,
	CONSTRAINT "carrinho_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.tamanhos_disponiveis" (
	"id" serial NOT NULL,
	"id_produto" int NOT NULL,
	"id_tamanho" int NOT NULL,
	CONSTRAINT "tamanhos_disponiveis_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk0" FOREIGN KEY ("id_categoria") REFERENCES "categorias"("id");



ALTER TABLE "compra_por_produto" ADD CONSTRAINT "compra_por_produto_fk0" FOREIGN KEY ("id_usuario") REFERENCES "usuarios"("id");
ALTER TABLE "compra_por_produto" ADD CONSTRAINT "compra_por_produto_fk1" FOREIGN KEY ("id_produto") REFERENCES "produtos"("id");
ALTER TABLE "compra_por_produto" ADD CONSTRAINT "compra_por_produto_fk2" FOREIGN KEY ("id_tamanho") REFERENCES "tamanhos"("id");

ALTER TABLE "carrinho" ADD CONSTRAINT "carrinho_fk0" FOREIGN KEY ("id_da_compra_por_produto") REFERENCES "compra_por_produto"("id");

ALTER TABLE "tamanhos_disponiveis" ADD CONSTRAINT "tamanhos_disponiveis_fk0" FOREIGN KEY ("id_produto") REFERENCES "produtos"("id");
ALTER TABLE "tamanhos_disponiveis" ADD CONSTRAINT "tamanhos_disponiveis_fk1" FOREIGN KEY ("id_tamanho") REFERENCES "tamanhos"("id");








