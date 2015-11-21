

INSERT INTO `address` (`id`, `city`, `state`, `street`, `zipCode`) VALUES
(1, 'Fairfield', 'Iowa', '1000 N 4TH Strret', '52557'),
(2, 'Fairfield', 'Iowa', '1000 N 4TH Strret', '52557');

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `firstName`, `middleName`, `lastName`, `dateOfBirth`, `email`, `phone`, `gender`, `address_id`, `users_id`) VALUES
(1, 'AKM', '', 'Qamruzzaman', '1979-04-15', 'akm.qamruzzaman@yahoo.com', '641-954-2886', 'M', 1, 1),
(2, 'User', '', 'User', '0000-00-00', 'user@yahoo.com', '641-123-8765', 'M', 2, 2);


--
-- Dumping data for table `laundryitem`
--

INSERT INTO `laundryitem` (`item_id`, `name`, `description`, `price`, `status`, `service_id`) VALUES
(1, 'Laundry Shirt', 'Laundry Shirt', '0.50', 'Active', 1),
(2, 'Laundry Pant', 'Laundry Pant', '0.50', 'Active', 1),
(3, 'Laundry Jeans', 'Laundry Jeans', '0.45', 'Active', 1),
(4, 'Washing Shirt', 'Washing Shirt', '0.45', 'Active', 2),
(5, 'Washing Pant', 'Washing Pant', '0.45', 'Active', 2),
(6, 'Washing Jeans', 'Washing Jeans', '1.00', 'Active', 2),
(7, 'Washing Jacket', 'Washing Jacket', '1.50', 'Active', 2),
(8, 'Washing winter jacket', 'Washing winter jacket', '2.00', 'Active', 2),
(9, 'Police normal shoe', 'Police normal shoe', '1.50', 'Active', 3),
(10, 'Police winter shoe', 'Police winter shoe', '2.50', 'Active', 3);

--
-- Dumping data for table `laundryservice`
--

INSERT INTO `laundryservice` (`service_id`, `name`, `status`) VALUES
(1, 'Laundry', 'Active'),
(2, 'Washing', 'Active'),
(3, 'Shoe Police', 'Active');

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `username`, `authority`, `enabled`) VALUES
(1, 'admin', 'admin', 'ROLE_ADMIN', 1),
(2, 'user', 'user', 'ROLE_USER', 1);

