package com.drumhub.web.drumhub.services;

import com.drumhub.web.drumhub.models.UserAddress;
import com.drumhub.web.drumhub.repositories.UserAddressRepository;

import java.util.List;

public class UserAddressService {
    private final UserAddressRepository userAddressRepository = new UserAddressRepository();

    public List<UserAddress> all() {
        return userAddressRepository.all();
    }

    public boolean create(UserAddress address) {
        return userAddressRepository.create(address);
    }

    public UserAddress find(int id) {
        return userAddressRepository.find(id);
    }

    public int update(UserAddress address) {
        return userAddressRepository.update(address);
    }

    public int delete(int id) {
        return userAddressRepository.delete(id);
    }

}
