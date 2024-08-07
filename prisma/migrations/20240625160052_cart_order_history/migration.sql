-- CreateTable
CREATE TABLE "TB_CART" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "locked" BOOLEAN NOT NULL,

    CONSTRAINT "TB_CART_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TB_CART_PRODUCT" (
    "cartId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,

    CONSTRAINT "TB_CART_PRODUCT_pkey" PRIMARY KEY ("cartId","productId")
);

-- CreateIndex
CREATE UNIQUE INDEX "TB_CART_userId_key" ON "TB_CART"("userId");

-- AddForeignKey
ALTER TABLE "TB_CART_PRODUCT" ADD CONSTRAINT "TB_CART_PRODUCT_cartId_fkey" FOREIGN KEY ("cartId") REFERENCES "TB_CART"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TB_CART_PRODUCT" ADD CONSTRAINT "TB_CART_PRODUCT_userId_fkey" FOREIGN KEY ("userId") REFERENCES "TB_USER"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TB_CART_PRODUCT" ADD CONSTRAINT "TB_CART_PRODUCT_productId_fkey" FOREIGN KEY ("productId") REFERENCES "TB_PRODUCT"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
