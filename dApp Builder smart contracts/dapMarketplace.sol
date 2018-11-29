pragma solidity 0.5.0;

contract dapMarketplace{
    
    struct Product{
        uint8 id;
        uint256 eth_price;
        uint256 dap_price;
        int8 builder_id;
        address owner;
    }
    
    mapping (address => mapping(uint8 => uint8)) public purchasedProducts;
    Product[] public products;
    
}