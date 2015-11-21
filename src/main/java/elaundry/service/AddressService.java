package elaundry.service;


import java.util.List;

import elaundry.domain.Address;


public interface AddressService
{
    List<Address> getAllAddress();
    void addAddress(Address address);
}
