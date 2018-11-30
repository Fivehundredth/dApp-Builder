pragma solidity 0.5.0;

contract dapMarketplace{
    
    struct Product{
        uint256 id;
        uint256 eth_price;
        uint256 dap_price;
        uint8 builder_id;
        address owner;
    }
    
    mapping (uint256 => mapping(uint256 => uint256)) public purchasedProducts;
    Product[] public products;
    address private admin;
    uint256 private builder_fee;
    
    constructor(address _admin) public{
        admin = _admin;
    }
    function createProduct(uint256 _eth, uint256 _dap, uint8 _id) external returns (uint256){
        uint256 newId = products.length++;
        products[newId].owner = msg.sender;
        products[newId].eth_price = _eth;
        products[newId].dap_price = _dap;
        products[newId].builder_id = _id;
        return newId;
    }
    function getProduct(uint8 _id) external view returns(uint256 eth, uint256 dap, address owner) {
        for (uint8 i = 0;i<products.length;i++){
            if (products[i].builder_id == _id){
                return (products[i].eth_price, products[i].dap_price, products[i].owner);
            }
        }
    }
    function getPurchaseCount(uint256 _userid, uint256 _productid) public view returns (uint256 count) {
        return purchasedProducts[_userid][_productid];
    }
}