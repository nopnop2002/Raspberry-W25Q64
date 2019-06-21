# Raspberry-W25Q64

SPI Flash Memory W25Q64 Access Library for RaspberryPi  
I ported from here.  

https://github.com/Tamakichi/Arduino-W25Q64

---

# Build
```
git clone https://github.com/nopnop2002/Raspberry-W25Q64
cd Raspberry-W25Q64
make
```

---

# API

// Start Flash  
void W25Q64_begin(uint8_t spich);  

// Get status register1  
uint8_t W25Q64_readStatusReg1(void);  

// Get status register2  
uint8_t W25Q64_readStatusReg2(void);  

// Get JEDEC ID(Manufacture, Memory Type,Capacity)  
void W25Q64_readManufacturer(uint8_t* d);  

// Get Unique ID  
void W25Q64_readUniqieID(uint8_t* d);  

// Check busy  
bool W25Q64_IsBusy(void);  

// Set power down mode  
void W25Q64_powerDown(void);  

// Set write enable  
void W25Q64_WriteEnable(void);  

// Set write disable  
void W25Q64_WriteDisable(void);  

// Read data from memory  
uint16_t W25Q64_read(uint32_t addr,uint8_t *buf,uint16_t n);

// First read data from memory  
uint16_t W25Q64_fastread(uint32_t addr,uint8_t *buf,uint16_t n);  

// Erase data by Sector  
bool W25Q64_eraseSector(uint16_t sect_no, bool flgwait);  

// Erase data by block(64KB)  
bool W25Q64_erase64Block(uint16_t blk_no, bool flgwait);  

// Erase data by Block(32KB)  
bool W25Q64_erase32Block(uint16_t blk_no, bool flgwait);  

// Erase all data  
bool W25Q64_eraseAll(bool flgwait);  

// Write data to memory  
uint16_t W25Q64_pageWrite(uint16_t sect_no, uint16_t inaddr, uint8_t* data, uint16_t n);  

---

# Wireing  

![w25q64](https://cloud.githubusercontent.com/assets/6020549/24319836/446fbc52-116b-11e7-9269-c4769eb4d8f9.jpg)

---

# Output

![w25q64-1](https://cloud.githubusercontent.com/assets/6020549/24319621/77591c5a-1164-11e7-88d0-052a09feb6e5.jpg)

JEDEC ID:  
Byte1 : ManufacturerID(0xef=Winbond)  
Byte2 : MemoryType(0x40=SPI/0x60=QPI)  
Byte3 : Capacity(2^0x17=2^23=0x800000=8M Byte=64M Bit)  

First 10Byte : ASCII 0-9  
Next 32Byte : ASCII A-Z  

