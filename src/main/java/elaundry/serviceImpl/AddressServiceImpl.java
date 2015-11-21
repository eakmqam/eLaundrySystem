

package elaundry.serviceImpl;


import java.util.List;

import elaundry.domain.Address;
import elaundry.repository.AddressRepository;
import elaundry.service.AddressService;


public class AddressServiceImpl implements AddressService
{

    AddressRepository addressRepository;

   
    public List<Address> getAllAddress()
    {
        return addressRepository.getAllAddresses();
        
    }

    public void addAddress(Address address)
    {
        
        addressRepository.save(address);
        
    }
    
}
