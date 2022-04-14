package service;

import models.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductServices {

    public static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "mac", 3000, "vip", "Apple"));
        products.put(2, new Product(2, "mac", 3000, "vip", "Apple"));
        products.put(3, new Product(3, "mac", 3000, "vip", "Apple"));
        products.put(4, new Product(4, "mac", 3000, "vip", "Apple"));
        products.put(5, new Product(5, "mac", 3000, "vip", "Apple"));
        products.put(6, new Product(6, "mac", 3000, "vip", "Apple"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void addNew(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }
}
