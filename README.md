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
void W25Q64_readManufacturer(uint8_t* jedc);  

// Get Unique ID  
void W25Q64_readUniqieID(uint8_t* id);  

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

- W25Q64   
![w25q64](https://user-images.githubusercontent.com/6020549/81263674-0fe0f680-907b-11ea-83dc-f806963e34ae.jpg)

JEDEC ID:  
Byte1 : ManufacturerID(0xef=Winbond)  
Byte2 : MemoryType(0x40=SPI/0x60=QPI)  
Byte3 : Capacity(2^0x17=2^23=0x800000=8M Byte=64M Bit)  

First 10Byte : ASCII 0-9  
Next 32Byte : ASCII A-Z  

- W25Q80   
![w25q80](https://user-images.githubusercontent.com/6020549/81263649-05266180-907b-11ea-9508-eb5468807b08.jpg)

- W25Q16   
![w25q16](https://user-images.githubusercontent.com/6020549/81263655-0788bb80-907b-11ea-89ae-092459ec8fad.jpg)

- W25Q32   
![w25q32](https://user-images.githubusercontent.com/6020549/81263666-0bb4d900-907b-11ea-9a55-f90f2a60bd5b.jpg)

- W25Q128   
![w25q128](https://user-images.githubusercontent.com/6020549/81263679-12435080-907b-11ea-989e-8f8aa7fd80d0.jpg)

