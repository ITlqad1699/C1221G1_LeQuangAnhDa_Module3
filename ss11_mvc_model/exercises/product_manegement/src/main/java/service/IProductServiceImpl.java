package service;

import models.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IProductServiceImpl implements IProductService{
    private  static Map<Integer, Product> productMap;
    static {
        productMap = new HashMap<>();
        productMap.put(1, new Product(1,"Mac0s",3000,"sản phẩm chính hãng","Apple"));
        productMap.put(2, new Product(2,"Mobile",4000,"Sắc nét tinh xảo","Apple"));
        productMap.put(3, new Product(3,"Mac0s",1000,"hàng thật việc thật","SamSung"));
        productMap.put(4, new Product(4,"Mac0s",2000,"sản phẩm chính hãng","Dell"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void add(Product product) {
        productMap.put(product.getId(),product);
    }

    @Override
    public Product findByID(int id) {
        return productMap.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id,product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }
}
