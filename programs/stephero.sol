contract Marketplace {
 
    struct_1137[] _items; 
    struct_1138[] _offers;
    mapping (uint256 => uint8) map_3; 
    mapping (uint256 => struct_1143) owner_4; 
    mapping (uint256 => mapping (uint256 => uint256)) owner_5; 
    mapping (uint256 => uint256) _poolAmount; 
    mapping (uint256 => mapping (uint256 => uint256)) owner_7; 
    mapping (uint256 => uint256) map_8;
    uint256 stor_9; 
    uint256 stor_a; 
    uint256 _ownerCutPerMillion; 
    uint256 _referralFee; 
    address _owner; 
    uint8 _paused; 

    struct struct_1138 { address field0; uint256 field1; uint256 field2; address field3; uint256 field4; uint256 field5; };
    struct struct_1137 { address field0; uint256 field1; address field2; uint256 field3; uint256 field4; uint256 field5; uint256 field6; address field7; uint256 field8; uint256 field9; };
    struct struct_1143 { uint160 field0_0_19; uint8 field0_20_20; };

    ChangedOwnerCutPerMillion(uint256);
    Buy(address, uint256, uint256);
    CancelOffer(address, uint256, uint256);
    Unpaused(address);
    OwnershipTransferred(address, address);
    Paused(address);

    function function_selector() public payable { 
        revert();
    }

    function supportsInterface(bytes4 interfaceId) public nonPayable {  
        require(msg.data.length - 4 >= 32);
        v0 = v1 = 0x4e2312e000000000000000000000000000000000000000000000000000000000 == interfaceId;
        if (0x4e2312e000000000000000000000000000000000000000000000000000000000 != interfaceId) {
            v0 = interfaceId == 0x1ffc9a700000000000000000000000000000000000000000000000000000000;
        }
        return bool(v0);
    }

    function pool() public nonPayable {  find similar
        return address(0x92179034e3f708b2c4779a5dd2824ac11c611a60);
    }

    function setOwnerCutPerMillion(uint256 _cutPerMillion) public nonPayable {  find similar
        require(msg.data.length - 4 >= 32);
        require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
        require(_cutPerMillion < 10 ** 6, Error('!0 to 999,999'));
        _ownerCutPerMillion = _cutPerMillion;
        emit ChangedOwnerCutPerMillion(_cutPerMillion);
    }

    function 0x1d046587() public nonPayable {  find similar
        return stor_9;
    }

    function 0x2c96(uint256 varg0, bytes4 varg1, address varg2) private { 
        MEM[MEM[64] + 32] = varg1 | uint224(MEM[MEM[64] + 32]);
        if (this.balance >= 0) {
            if (varg2.code.size) {
                v0 = v1 = 0;
                while (v0 < varg0 - MEM[64] - 32) {
                    MEM[v0 + MEM[64]] = MEM[v0 + (MEM[64] + 32)];
                    v0 += 32;
                }
                if (v0 > varg0 - MEM[64] - 32) {
                    MEM[varg0 - MEM[64] - 32 + MEM[64]] = 0;
                }
                v2, /* uint256 */ v3, /* uint256 */ v4, /* uint256 */ v5 = varg2.call(MEM[MEM[64]:MEM[64] + v2c96arg0x0 - MEM[64] - 32 + MEM[64] - MEM[64]], MEM[MEM[64]:MEM[64]]).gas(msg.gas);
                if (RETURNDATASIZE() == 0) {
                    v6 = v7 = 96;
                } else {
                    v6 = v8 = new bytes[](RETURNDATASIZE());
                    RETURNDATACOPY(v8.data, 0, RETURNDATASIZE());
                }
                if (!v2) {
                    require(!MEM[v6], v5, MEM[v6]);
                    v9 = new bytes[](v10.length);
                    v11 = v12 = 0;
                    while (v11 < v10.length) {
                        v9[v11] = v10[v11];
                        v11 += 32;
                    }
                    if (v11 > v10.length) {
                        v9[v10.length] = 0;
                    }
                    revert(Error(v9, v13, 'SafeERC20: low-level call failed'));
                } else if (!MEM[v6]) {
                    return ;
                } else {
                    require(32 + v6 + MEM[v6] - (32 + v6) >= 32);
                    require(MEM[32 + v6] == bool(MEM[32 + v6]));
                    require(MEM[32 + v6], Error('SafeERC20: ERC20 operation did not succeed'));
                    return ;
                }
            } else {
                MEM[MEM[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000;
                MEM[MEM[64] + 4] = 32;
                revert(Error('Address: call to non-contract'));
            }
        } else {
            MEM[MEM[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000;
            MEM[MEM[64] + 4] = 32;
            revert(Error('Address: insufficient balance for call'));
        }
    }

    function setExtendFee(uint256 varg0, uint256 varg1) public nonPayable {  find similar
        require(msg.data.length - 4 >= 64);
        require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
        require(varg0 < _items.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(msg.sender == _items[varg0].field2_0_19, Error('not-item-owner'));
        v0 = _SafeAdd(varg1, _referralFee);
        require(v0 < 10 ** 6, Error('over 100 percent'));
        map_8[varg0] = varg1;
    }

    function 0x2d1e(address varg0, uint256 varg1, address varg2) private { 
        if (varg0) {
            MEM[MEM[64] + 36] = varg2;
            MEM[MEM[64] + 68] = varg1;
            0x2c96(100 + MEM[64], 0xa9059cbb00000000000000000000000000000000000000000000000000000000, varg0);
            return ;
        } else {
            v0, /* uint256 */ v1 = varg2.call().value(varg1).gas(msg.gas);
            if (RETURNDATASIZE() != 0) {
                v2 = new bytes[](RETURNDATASIZE());
                v1 = v2.data;
                RETURNDATACOPY(v1, 0, RETURNDATASIZE());
            }
            require(v0, Error('transfer-BNB-failed'));
            return ;
        }
    }

    function 0x2de8(uint256 varg0, uint256 varg1, uint256 varg2, address varg3, address varg4, address varg5) private { 
        if (!owner_4[varg5].field0_0_19) {
            v0 = _SafeSub(varg2, varg1);
            v1 = _SafeAdd(_poolAmount[varg3], v0);
            _poolAmount[varg3] = v1;
        } else {
            v2 = _SafeAdd(_referralFee, varg0);
            v3 = _SafeMul(varg2, v2);
            require(10 ** 6, Panic(18)); // division by zero
            v4 = _SafeSub(varg2, v3 / 10 ** 6);
            v5 = _SafeSub(v4, varg1);
            v6 = _SafeAdd(_poolAmount[varg3], v5);
            _poolAmount[varg3] = v6;
            v7 = _SafeAdd(owner_5[owner_4[varg5].field0_0_19][varg3], v3 / 10 ** 6);
            owner_5[owner_4[varg5].field0_0_19][varg3] = v7;
            emit 0x5ee859e646f3ac91c79ff800b6da9fcdf84875df3ee988716632f76bd7a76bf9(varg4, varg5, owner_4[varg5].field0_0_19, varg3, varg2, v3 / 10 ** 6);
        }
        return ;
    }

    function unpause() public nonPayable {  find similar
        require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
        require(_paused, Error('Pausable: not paused'));
        _paused = 0;
        emit Unpaused(msg.sender);
    }

    function 0x5409ebc1(address varg0, bool varg1) public nonPayable {  find similar
        require(msg.data.length - 4 >= 64);
        require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
        map_3[varg0] = varg1;
    }

    function paused() public nonPayable {  find similar
        return _paused;
    }

    function buyAsset(uint256 varg0, uint256 varg1, address varg2) public payable {  find similar
        require(msg.data.length - 4 >= 96);
        require(!_paused, Error('Pausable: paused'));
        require(varg0 < _items.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v0 = v1 = _items[varg0].field3 >= varg1;
        if (_items[varg0].field3 >= varg1) {
            require(uint8(_items[varg0].field5) <= 2, Panic(33)); // failed convertion to enum type
            v0 = v2 = uint8(_items[varg0].field5) == 0;
        }
        require(v0, Error('item-unavailable'));
        v3 = v4 = !_items[varg0].field4;
        if (_items[varg0].field4) {
            v5 = _SafeAdd(varg1, owner_7[msg.sender][varg0]);
            v3 = v6 = v5 <= _items[varg0].field4;
        }
        require(v3, Error('Exceed buy limit'));
        v7 = v8 = !_items[varg0].field9;
        if (_items[varg0].field9) {
            v7 = v9 = block.timestamp >= _items[varg0].field8;
            if (block.timestamp >= _items[varg0].field8) {
                v7 = v10 = block.timestamp <= _items[varg0].field9;
            }
        }
        require(v7, Error('item-unavailable'));
        require(msg.sender != _items[varg0].field2_0_19, Error('Can not buy your own'));
        if (bool(_items[varg0].field7_0_19)) {
            require(!msg.value, Error('not-using-bnb'));
        } else {
            v11 = _SafeMul(_items[varg0].field6, varg1);
            require(msg.value == v11, Error('invalid value'));
        }
        if (!owner_4[msg.sender].field0_20_20) {
            owner_4[msg.sender].field0_0_19 = varg2;
            owner_4[msg.sender].field0_20_20 = 1;
        }
        v12 = _SafeMul(varg1, _items[varg0].field6);
        v13 = _SafeSub(_items[varg0].field3, varg1);
        _items[varg0].field3 = v13;
        if (!_items[varg0].field3) {
            _items[varg0].field5 = 0x1 | bytes31(_items[varg0].field5);
        }
        v14 = _SafeAdd(owner_7[msg.sender][varg0], varg1);
        owner_7[msg.sender][varg0] = v14;
        v15 = new uint256[](32);
        v16 = v17 = 0;
        while (v16 < 32) {
            MEM[v16 + v15.data] = MEM[v16 + (MEM[64] + 32)];
            v16 += 32;
        }
        if (v16 > 32) {
            MEM[32 + v15.data] = 0;
        }
        require(bool((_items[varg0].field0_0_19).code.size));
        v18 = _items[varg0].field0_0_19.safeTransferFrom(address(0x92179034e3f708b2c4779a5dd2824ac11c611a60), msg.sender, _items[varg0].field1, varg1, v15, v19, 0xf23a6e612e1ff4830e658fe43f4e3cb4a5f8170bd5d9e69fb5d7a7fa9e4fdf97).gas(msg.gas);
        require(bool(v18), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        if (_items[varg0].field7_0_19) {
            MEM[MEM[64] + 36] = msg.sender;
            MEM[MEM[64] + 68] = address(0x92179034e3f708b2c4779a5dd2824ac11c611a60);
            MEM[MEM[64] + 100] = v12;
            0x2c96(132 + MEM[64], 0x23b872dd00000000000000000000000000000000000000000000000000000000, _items[varg0].field7_0_19);
        }
        v20 = _SafeSub(10 ** 6, _ownerCutPerMillion);
        v21 = _SafeSub(v20, map_8[varg0]);
        v22 = _SafeMul(v12, v21);
        require(10 ** 6, Panic(18)); // division by zero
        0x2d1e(_items[varg0].field7_0_19, v22 / 10 ** 6, _items[varg0].field2_0_19);
        0x2de8(map_8[varg0], v22 / 10 ** 6, v12, _items[varg0].field7_0_19, _items[varg0].field0_0_19, msg.sender);
        emit Buy(msg.sender, varg0, varg1);
    }

    function 0x6c684aad() public nonPayable {  find similar
        return stor_a;
    }

    function setReferralFee(uint256 newFee) public nonPayable {  find similar
        require(msg.data.length - 4 >= 32);
        require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
        require(newFee < _ownerCutPerMillion, Error('referral fee >= owner cut'));
        _referralFee = newFee;
        emit 0x839ad7e0144ab966981fb3b209f0706f68f75c7c0c9150da5744eae375845892(newFee);
    }

    function _SafeAdd(uint256 varg0, uint256 varg1) private { 
        require(varg0 <= ~varg1, Panic(17)); // arithmetic overflow or underflow
        return varg0 + varg1;
    }

    function renounceOwnership() public nonPayable {  find similar
        require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
        _owner = 0;
        emit OwnershipTransferred(_owner, address(0x0));
    }

    function _SafeMul(uint256 varg0, uint256 varg1) private { 
        require(!(bool(varg0) & (varg1 > uint256.max / varg0)), Panic(17)); // arithmetic overflow or underflow
        return varg0 * varg1;
    }

    function _SafeSub(uint256 varg0, uint256 varg1) private { 
        require(varg0 >= varg1, Panic(17)); // arithmetic overflow or underflow
        return varg0 - varg1;
    }

    function 0x3a1f(uint256 varg0) private { 
        require(varg0 != uint256.max, Panic(17)); // arithmetic overflow or underflow
        return 1 + varg0;
    }

    function 0x7266572e(address varg0, uint256 varg1) public nonPayable {  find similar
        require(msg.data.length - 4 >= 64);
        return owner_7[varg0][varg1];
    }

    function acceptOffer(uint256 _offerId, uint256 _amount) public nonPayable {  find similar
        require(msg.data.length - 4 >= 64);
        require(!_paused, Error('Pausable: paused'));
        require(_amount < _offers.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(_offerId < _items.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(_offers[_amount].field1 == _offerId, Error('item-and-offer-not-matching'));
        require(msg.sender == _items[_offerId].field2_0_19, Error('not-item-owner'));
        require(uint8(_items[_offerId].field5) <= 2, Panic(33)); // failed convertion to enum type
        v0 = v1 = uint8(_items[_offerId].field5) == 0;
        if (v1) {
            v0 = v2 = _items[_offerId].field3 >= _offers[_amount].field2;
        }
        require(v0, Error('item-unavailable'));
        v3 = v4 = !_items[_offerId].field9;
        if (_items[_offerId].field9) {
            v3 = v5 = block.timestamp >= _items[_offerId].field8;
            if (block.timestamp >= _items[_offerId].field8) {
                v3 = v6 = block.timestamp <= _items[_offerId].field9;
            }
        }
        require(v3, Error('item-unavailable'));
        require(uint8(_offers[_amount].field5) <= 2, Panic(33)); // failed convertion to enum type
        require(uint8(_offers[_amount].field5) == 0, Error('!available'));
        v7 = _SafeSub(_items[_offerId].field3, _offers[_amount].field2);
        _items[_offerId].field3 = v7;
        if (!_items[_offerId].field3) {
            _items[_offerId].field5 = 0x1 | bytes31(_items[_offerId].field5);
        }
        _offers[_amount].field5 = 0x1 | bytes31(_offers[_amount].field5);
        v8 = _SafeAdd(owner_7[_offers[_amount].field0_0_19][_offerId], _offers[_amount].field2);
        owner_7[_offers[_amount].field0_0_19][_offerId] = v8;
        v9 = _SafeSub(10 ** 6, _ownerCutPerMillion);
        v10 = _SafeSub(v9, map_8[_offerId]);
        v11 = _SafeMul(_offers[_amount].field4, v10);
        require(10 ** 6, Panic(18)); // division by zero
        v12 = new uint256[](32);
        v13 = v14 = 0;
        while (v13 < 32) {
            MEM[v13 + v12.data] = MEM[v13 + (MEM[64] + 32)];
            v13 += 32;
        }
        if (v13 > 32) {
            MEM[32 + v12.data] = 0;
        }
        require(bool((_items[_offerId].field0_0_19).code.size));
        v15 = _items[_offerId].field0_0_19.safeTransferFrom(address(0x92179034e3f708b2c4779a5dd2824ac11c611a60), _offers[_amount].field0_0_19, _items[_offerId].field1, _offers[_amount].field2, v12, v16, 0xf23a6e612e1ff4830e658fe43f4e3cb4a5f8170bd5d9e69fb5d7a7fa9e4fdf97).gas(msg.gas);
        require(bool(v15), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        0x2d1e(_offers[_amount].field3_0_19, v11 / 10 ** 6, _items[_offerId].field2_0_19);
        0x2de8(map_8[_offerId], v11 / 10 ** 6, _offers[_amount].field4, _offers[_amount].field3_0_19, _items[_offerId].field0_0_19, _offers[_amount].field0_0_19);
        emit 0x78883b423a9bcaae31e2c12e73524d70d02bf0fa71626c400e8c3d896837508d(msg.sender, _offerId, _amount);
    }

    function pause() public nonPayable {  find similar
        require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
        require(!_paused, Error('Pausable: paused'));
        _paused = 1;
        emit Paused(msg.sender);
    }

    function referralFee() public nonPayable {  find similar
        return _referralFee;
    }

    function offers(uint256 varg0) public nonPayable {  find similar
        require(msg.data.length - 4 >= 32);
        require(varg0 < _offers.length);
        require(uint8(_offers[varg0].field5) < 3, Panic(33)); // failed convertion to enum type
        return _offers[varg0].field0_0_19, _offers[varg0].field1, _offers[varg0].field2, _offers[varg0].field3_0_19, _offers[varg0].field4, uint8(_offers[varg0].field5);
    }

    function owner() public nonPayable {  find similar
        return _owner;
    }

    function 0x91ddc5e0(address varg0) public nonPayable {  find similar
        require(msg.data.length - 4 >= 32);
        return map_3[varg0];
    }

    function ownerCutPerMillion() public nonPayable {  find similar
        return _ownerCutPerMillion;
    }

    function poolAmount(address varg0) public nonPayable {  find similar
        require(msg.data.length - 4 >= 32);
        return _poolAmount[varg0];
    }

    function 0xac20f2ea(address varg0, address varg1) public nonPayable {  find similar
        require(msg.data.length - 4 >= 64);
        return owner_5[varg0][varg1];
    }
 
    function createOffer(uint256 varg0, uint256 varg1, uint256 varg2, address varg3, address varg4) public payable {  find similar
        require(msg.data.length - 4 >= 160);
        require(!_paused, Error('Pausable: paused'));
        require(map_3[varg3], Error('!paymentToken'));
        require(varg0 < _items.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        MEM[MEM[64]] = _items[varg0].field0_0_19;
        MEM[MEM[64] + 32] = _items[varg0].field1;
        MEM[MEM[64] + 64] = _items[varg0].field2_0_19;
        require(uint8(_items[varg0].field5) <= 2, Panic(33)); // failed convertion to enum type
        require(uint8(_items[varg0].field5) <= 2, Panic(33)); // failed convertion to enum type
        MEM[MEM[64] + 160 + 32] = _items[varg0].field6;
        MEM[MEM[64] + 160 + 64] = _items[varg0].field7_0_19;
        MEM[MEM[64] + 160 + 96] = _items[varg0].field8;
        MEM[MEM[64] + 160 + 128] = _items[varg0].field9;
        v0 = v1 = varg1 <= _items[varg0].field3;
        if (varg1 <= _items[varg0].field3) {
            require(uint8(_items[varg0].field5) <= 2, Panic(33)); // failed convertion to enum type
            v0 = v2 = uint8(_items[varg0].field5) == 0;
        }
        require(v0, Error('item-unavailable'));
        if (bool(varg3)) {
            require(!msg.value, Error('not-using-bnb'));
        } else {
            require(msg.value == varg2, Error('callvalue!=_paymentAmount'));
        }
        v3 = v4 = !_items[varg0].field4;
        if (_items[varg0].field4) {
            v5 = _SafeAdd(varg1, owner_7[msg.sender][varg0]);
            v3 = v6 = v5 <= _items[varg0].field4;
        }
        require(v3, Error('Exceed buy limit'));
        if (!owner_4[msg.sender].field0_20_20) {
            owner_4[msg.sender].field0_20_20 = 1;
            owner_4[msg.sender].field0_0_19 = varg4;
        }
        require(0 <= 2, Panic(33)); // failed convertion to enum type
        _offers.length = _offers.length + 1;
        _offers[_offers.length].field0_0_19 = msg.sender;
        _offers[_offers.length].field1 = varg0;
        _offers[_offers.length].field2 = varg1;
        _offers[_offers.length].field3_0_19 = varg3;
        _offers[_offers.length].field4 = varg2;
        require(0 <= 2, Panic(33)); // failed convertion to enum type
        _offers[_offers.length].field5 = 0x0 | bytes31(_offers[_offers.length].field5);
        if (varg3) {
            MEM[MEM[64] + 36] = msg.sender;
            MEM[MEM[64] + 68] = address(0x92179034e3f708b2c4779a5dd2824ac11c611a60);
            MEM[MEM[64] + 100] = varg2;
            0x2c96(132 + MEM[64], 0x23b872dd00000000000000000000000000000000000000000000000000000000, varg3);
        }
        emit 0x53a75e87caa0fc3c594c8d94e2c6277c8878d496021cc257d06d53f0061f3ac3(msg.sender, stor_a, varg0, varg1, varg3, varg2);
        v7 = 0x3a1f(stor_a);
        stor_a = v7;
        return stor_a;
    }

    function onERC1155BatchReceived(address varg0, address varg1, uint256[] varg2, uint256[] varg3, bytes varg4) public nonPayable {  find similar
        require(msg.data.length - 4 >= 160);
        require(varg2 <= uint64.max);
        v0 = v1 = 0;
        require(4 + varg2 + 31 < msg.data.length, v1, v1);
        require(varg2.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v2 = new uint256[](varg2.length);
        require(!((v2 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & (varg2.length << 5) + 32 + 31) < v2) | (v2 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & (varg2.length << 5) + 32 + 31) > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
        v3 = v4 = v2.data;
        v5 = v6 = varg2.data;
        require(msg.data.length >= 32 + (4 + varg2 + (varg2.length << 5)), v1, v1);
        while (v0 < varg2.length) {
            MEM[v3] = msg.data[v5];
            v0 += 1;
            v3 += 32;
            v5 += 32;
        }
        require(varg3 <= uint64.max);
        v7 = v8 = 0;
        require(4 + varg3 + 31 < msg.data.length, v8, v8);
        require(varg3.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v9 = new uint256[](varg3.length);
        require(!((v9 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & (varg3.length << 5) + 32 + 31) < v9) | (v9 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & (varg3.length << 5) + 32 + 31) > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
        v10 = v11 = v9.data;
        v12 = v13 = varg3.data;
        require(msg.data.length >= 32 + (4 + varg3 + (varg3.length << 5)), v8, v8);
        while (v7 < varg3.length) {
            MEM[v10] = msg.data[v12];
            v7 += 1;
            v10 += 32;
            v12 += 32;
        }
        require(varg4 <= uint64.max);
        require(4 + varg4 + 31 < msg.data.length);
        require(varg4.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v14 = new bytes[](varg4.length);
        require(!((v14 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & (varg4.length + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31) < v14) | (v14 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & (varg4.length + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31) > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
        require(4 + varg4 + varg4.length + 32 <= msg.data.length);
        CALLDATACOPY(v14.data, varg4.data, varg4.length);
        v14[varg4.length] = 0;
        return bytes4(0xbc197c8100000000000000000000000000000000000000000000000000000000);
    }

    function items(uint256 varg0) public nonPayable {  find similar
        require(msg.data.length - 4 >= 32);
        require(varg0 < _items.length);
        require(uint8(_items[varg0].field5) < 3, Panic(33)); // failed convertion to enum type
        return _items[varg0].field0_0_19, _items[varg0].field1, _items[varg0].field2_0_19, _items[varg0].field3, _items[varg0].field4, uint8(_items[varg0].field5), _items[varg0].field6, _items[varg0].field7_0_19, _items[varg0].field8, _items[varg0].field9;
    }

    function cancelList(uint256 _sellId) public nonPayable {  find similar
        require(msg.data.length - 4 >= 32);
        require(!_paused, Error('Pausable: paused'));
        require(_sellId < _items.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(msg.sender == _items[_sellId].field2_0_19, Error('not-item-owner'));
        require(uint8(_items[_sellId].field5) <= 2, Panic(33)); // failed convertion to enum type
        require(uint8(_items[_sellId].field5) == 0, Error('item-unavailable'));
        _items[_sellId].field5 = 0x2 | bytes31(_items[_sellId].field5);
        MEM[MEM[64] + 32] = 0xf23a6e612e1ff4830e658fe43f4e3cb4a5f8170bd5d9e69fb5d7a7fa9e4fdf97;
        MEM[64 + MEM[64]] = 0xf242432a00000000000000000000000000000000000000000000000000000000;
        MEM[68 + MEM[64]] = address(this);
        MEM[68 + MEM[64] + 32] = msg.sender;
        MEM[68 + MEM[64] + 64] = _items[_sellId].field1;
        MEM[68 + MEM[64] + 96] = _items[_sellId].field3;
        MEM[68 + MEM[64] + 128] = 160;
        MEM[68 + MEM[64] + 160] = 32;
        v0 = v1 = 0;
        while (v0 < 32) {
            MEM[v0 + (68 + MEM[64] + 160 + 32)] = MEM[v0 + (MEM[64] + 32)];
            v0 += 32;
        }
        if (v0 > 32) {
            MEM[32 + (68 + MEM[64] + 160 + 32)] = 0;
        }
        require(bool((_items[_sellId].field0_0_19).code.size));
        v2 = _items[_sellId].field0_0_19.call(MEM[MEM[64]:MEM[64] + 64 + 68 + MEM[64] + 160 - MEM[64]], MEM[MEM[64]:MEM[64]]).gas(msg.gas);
        require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        _items[_sellId].field3 = 0;
        emit 0x1d61dfd5197b0d775d02d8c8c234a82371b737d15012d195c885d0a59da7475(msg.sender, _sellId);
    }

    function 0xded4de3a(address varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, address varg5, uint256 varg6, uint256 varg7) public nonPayable {  find similar
        require(msg.data.length - 4 >= uint8.max + 1);
        require(!_paused, Error('Pausable: paused'));
        require(map_3[varg5], Error('!paymentToken'));
        require(varg4 > 0, Error('price = 0'));
        v0 = v1 = !varg7;
        if (varg7) {
            v0 = v2 = varg7 > block.timestamp;
            if (v2) {
                v0 = v3 = varg7 > varg6;
            }
        }
        require(v0, Error('Invalid expired'));
        require(0 <= 2, Panic(33)); // failed convertion to enum type
        _items.length += 1;
        _items[_items.length].field0_0_19 = varg0;
        _items[_items.length].field1 = varg1;
        _items[_items.length].field2_0_19 = msg.sender;
        _items[_items.length].field3 = varg2;
        _items[_items.length].field4 = varg3;
        require(0 <= 2, Panic(33)); // failed convertion to enum type
        _items[_items.length].field5 = 0x0 | bytes31(_items[_items.length].field5);
        _items[_items.length].field6 = varg4;
        _items[_items.length].field7_0_19 = varg5;
        _items[_items.length].field8 = varg6;
        _items[_items.length].field9 = varg7;
        v4 = 0x3a1f(stor_9);
        stor_9 = v4;
        v5 = new uint256[](32);
        v6 = v7 = 0;
        while (v6 < 32) {
            MEM[v6 + v5.data] = MEM[v6 + (MEM[64] + 32)];
            v6 += 32;
        }
        if (v6 > 32) {
            MEM[32 + v5.data] = 0;
        }
        require(bool(varg0.code.size));
        v8 = varg0.safeTransferFrom(msg.sender, address(0x92179034e3f708b2c4779a5dd2824ac11c611a60), varg1, varg2, v5, v9, 0xf23a6e612e1ff4830e658fe43f4e3cb4a5f8170bd5d9e69fb5d7a7fa9e4fdf97).gas(msg.gas);
        require(bool(v8), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[MEM[64] + 224] = varg5;
        MEM[MEM[64] + (uint8.max + 1)] = varg6;
        emit 0x6658b7f52d411660fe47d5f6ecccb81df31e7b7398638f06297a7c0e9c1db3de(msg.sender, stor_9, varg0, varg1, varg2, varg3, varg4, varg5, varg6, varg7);
        return stor_9;
    }

    function 0xe06f2bc2(address varg0) public nonPayable {  find similar
        require(msg.data.length - 4 >= 32);
        return owner_4[varg0].field0_0_19, owner_4[varg0].field0_20_20;
    }

    function claimReferral(address varg0) public nonPayable {  find similar
        require(msg.data.length - 4 >= 32);
        require(!_paused, Error('Pausable: paused'));
        require(owner_5[msg.sender][varg0], Error('not-enough-money'));
        0x2d1e(varg0, owner_5[msg.sender][varg0], msg.sender);
        owner_5[msg.sender][varg0] = 0;
        emit 0x9c21c092f05b64df5ae0cbf557b9bf4e9695cdbeaa13fcf9a0831bce847f0cfb(msg.sender, varg0, owner_5[msg.sender][varg0]);
    }

    function cancelOffer(uint256 _offerId) public nonPayable {  find similar
        require(msg.data.length - 4 >= 32);
        require(!_paused, Error('Pausable: paused'));
        require(_offerId < _offers.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(uint8(_offers[_offerId].field5) <= 2, Panic(33)); // failed convertion to enum type
        require(uint8(_offers[_offerId].field5) == 0, Error('offer-unavailable'));
        require(msg.sender == _offers[_offerId].field0_0_19, Error('not-owner'));
        _offers[_offerId].field5 = 0x2 | bytes31(_offers[_offerId].field5);
        if (_offers[_offerId].field3_0_19) {
            MEM[MEM[64] + 36] = msg.sender;
            MEM[MEM[64] + 68] = _offers[_offerId].field4;
            0x2c96(100 + MEM[64], 0xa9059cbb00000000000000000000000000000000000000000000000000000000, _offers[_offerId].field3_0_19);
        } else {
            v0, /* uint256 */ v1 = msg.sender.call().value(_offers[_offerId].field4).gas(msg.gas);
            if (RETURNDATASIZE() != 0) {
                v2 = new bytes[](RETURNDATASIZE());
                v1 = v2.data;
                RETURNDATACOPY(v1, 0, RETURNDATASIZE());
            }
            require(v0, Error('Transfer BNB failed'));
        }
        emit CancelOffer(msg.sender, _offers[_offerId].field1, _offerId);
    }

    function onERC1155Received(address varg0, address varg1, uint256 varg2, uint256 varg3, bytes varg4) public nonPayable {  find similar
        require(msg.data.length - 4 >= 160);
        require(varg4 <= uint64.max);
        require(4 + varg4 + 31 < msg.data.length);
        require(varg4.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v0 = new bytes[](varg4.length);
        require(!((v0 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & (varg4.length + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31) < v0) | (v0 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & (varg4.length + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31) > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
        require(4 + varg4 + varg4.length + 32 <= msg.data.length);
        CALLDATACOPY(v0.data, varg4.data, varg4.length);
        v0[varg4.length] = 0;
        return bytes4(0xf23a6e6100000000000000000000000000000000000000000000000000000000);
    }

    function transferOwnership(address newOwner) public nonPayable {  find similar
        require(msg.data.length - 4 >= 32);
        require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
        require(newOwner, Error('Ownable: new owner is the zero address'));
        _owner = newOwner;
        emit OwnershipTransferred(_owner, newOwner);
    }

    function withdraw(address token, address to) public nonPayable {  find similar
        require(msg.data.length - 4 >= 64);
        require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
        require(_poolAmount[to], Error('not-enough-money'));
        0x2d1e(to, _poolAmount[to], token);
        _poolAmount[to] = 0;
    }

    // Note: The function selector is not present in the original solidity code.
    // However, we display it for the sake of completeness.

    function function_selector( function_selector) public payable { 
        MEM[64] = 128;
        if (msg.data.length >= 4) {
            v0 = function_selector >> 224;
            if (0x8a72ea6a > v0) {
                if (0x60acd67f > v0) {
                    if (0x383c196a > v0) {
                        if (0x1ffc9a7 == v0) {
                            supportsInterface(bytes4);
                        } else if (0x16f0115b == v0) {
                            pool();
                        } else if (0x19dad16d == v0) {
                            setOwnerCutPerMillion(uint256);
                        } else if (0x1d046587 == v0) {
                            0x1d046587();
                        }
                    } else if (0x383c196a == v0) {
                        setExtendFee(uint256,uint256);
                    } else if (0x3f4ba83a == v0) {
                        unpause();
                    } else if (0x5409ebc1 == v0) {
                        0x5409ebc1();
                    } else {
                        require(0x5c975abb == v0);
                        paused();
                    }
                } else if (0x7266572e > v0) {
                    if (0x60acd67f == v0) {
                        buyAsset(uint256,uint256,address);
                    } else if (0x6c684aad == v0) {
                        0x6c684aad();
                    } else if (0x713494d7 == v0) {
                        setReferralFee(uint256);
                    } else {
                        require(0x715018a6 == v0);
                        renounceOwnership();
                    }
                } else if (0x7266572e == v0) {
                    0x7266572e();
                } else if (0x81257bd5 == v0) {
                    acceptOffer(uint256,uint256);
                } else if (0x8456cb59 == v0) {
                    pause();
                } else {
                    require(0x84ae2bc6 == v0);
                    referralFee();
                }
            } else if (0xbfb231d2 > v0) {
                if (0xa8024366 > v0) {
                    if (0x8a72ea6a == v0) {
                        offers(uint256);
                    } else if (0x8da5cb5b == v0) {
                        owner();
                    } else if (0x91ddc5e0 == v0) {
                        0x91ddc5e0();
                    } else {
                        require(0xa01f79d4 == v0);
                        ownerCutPerMillion();
                    }
                } else if (0xa8024366 == v0) {
                    poolAmount(address);
                } else if (0xac20f2ea == v0) {
                    0xac20f2ea();
                } else if (0xb7c38147 == v0) {
                    createOffer(uint256,uint256,uint256,address,address);
                } else {
                    require(0xbc197c81 == v0);
                    onERC1155BatchReceived(address,address,uint256[],uint256[],bytes);
                }
            } else if (0xe61aee51 > v0) {
                if (0xbfb231d2 == v0) {
                    items(uint256);
                } else if (0xc9c9d2d8 == v0) {
                    cancelList(uint256);
                } else if (0xded4de3a == v0) {
                    0xded4de3a();
                } else {
                    require(0xe06f2bc2 == v0);
                    0xe06f2bc2();
                }
            } else if (0xf23a6e61 > v0) {
                if (0xe61aee51 == v0) {
                    claimReferral(address);
                } else {
                    require(0xef706adf == v0);
                    cancelOffer(uint256);
                }
            } else if (0xf23a6e61 == v0) {
                onERC1155Received(address,address,uint256,uint256,bytes);
            } else if (0xf2fde38b == v0) {
                transferOwnership(address);
            } else {
                require(0xf940e385 == v0);
                withdraw(address,address);
            }
        }
        fallback();
    }
}
