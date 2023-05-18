# Raspberry-W25Q64

SPI Flash Memory W25Q64 Access Library for RaspberryPi  
I ported from here.  

https://github.com/Tamakichi/Arduino-W25Q64

---

# Software requirement
- WiringPi Library   
 This project uses the wiringPiSPISetup() function to initialize SPI, and use /dev/spidev0.0.   
 If you use it on a board other than the RPI board, you may need to change the SPI device.   
 As far as I know, there are these libraries.   
	- WiringPi for OrangePi   
	- WiringPi for BananaPi   
	- WiringPi for NanoPi   
	- WiringPi for Pine-64   

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

// Get status register2(Winbond only)  
uint8_t W25Q64_readStatusReg2(void);  

// Get JEDEC ID(Manufacture, Memory Type,Capacity)  
void W25Q64_readManufacturer(uint8_t* jedc);  

// Get Unique ID(Winbond only)  
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

# Winbond

|Device|# of Bytes|Address range|# of 4K-Sectors|# of 32K-Blocks|# of 64K-Blocks|JEDEC ID|
|:---|:---|:---|:---|:---|:---|:---|
|W25Q80|1M|0x0FFFFF|256|32|16|EF-40-14|
|W25Q16|2M|0x1FFFFF|512|64|32|EF-40-15|
|W25Q32|4M|0x3FFFFF|1024|128|64|EF-40-16|
|W25Q64|8M|0x7FFFFF|2048|256|128|EF-40-17|
|W25Q128|16M|0xFFFFFF|4096|512|256|EF-40-18|

The letters after the volume number indicate operating parameters.   
For example W25Q64BV, W25Q64CV, W25Q64FV, W25Q64JV are all the same 8 MB flash drives, but with different maximum frequencies and speeds.   
In theory you could replace slow with fast, but the other way around might not work.   
- BV: 80MHz  clock operation   
- CV: 104MHz clock operation   
- FV: 104MHz clock operation   
- JV: 133MHz clock operation   

## W25Q80   
![w25q80](https://user-images.githubusercontent.com/6020549/81263649-05266180-907b-11ea-9508-eb5468807b08.jpg)

JEDEC ID:  
Byte1 : ManufacturerID(0xef=Winbond)  
Byte2 : MemoryType(0x40=SPI/0x60=QPI)  
Byte3 : Capacity(2^0x14=2^20=0x100000=1M Byte=8M Bit)  

First 10Byte : ASCII 0-9  
Next 32Byte : ASCII A-Z  

## W25Q16   
![w25q16](https://user-images.githubusercontent.com/6020549/81263655-0788bb80-907b-11ea-89ae-092459ec8fad.jpg)

## W25Q32   
![w25q32](https://user-images.githubusercontent.com/6020549/81263666-0bb4d900-907b-11ea-9a55-f90f2a60bd5b.jpg)

## W25Q64   
![w25q64](https://user-images.githubusercontent.com/6020549/81263674-0fe0f680-907b-11ea-83dc-f806963e34ae.jpg)

## W25Q128   
![w25q128](https://user-images.githubusercontent.com/6020549/81263679-12435080-907b-11ea-989e-8f8aa7fd80d0.jpg)

---

# MACRONIX   

|Device|# of Bytes|Address range|# of 4K-Sectors|# of 32K-Blocks|# of 64K-Blocks|JEDEC ID|
|:---|:---|:---|:---|:---|:---|:---|
|MX25L32|4M|0x3FFFFF|1024|128|64|C2-20-16|
|MX25L64|8M|0x7FFFFF|2048|256|128|C2-20-17|
|MX25L128|16M|0xFFFFFF|4096|512|256|C2-20-18|

The letters after the volume number indicate operating parameters.   
For example, MX25L3205, MX25L3205A, MX25L3205D, MX25L3206E are all the same 8 MB flash drives, but with different maximum frequencies and speeds.   
In theory you could replace slow with fast, but the other way around might not work.   
- MX25L3205 50MHz serial clock   
- MX25L3205A 50MHz serial clock   
- MX25L3205D 86MHz serial clock   
- MX25L3206E 86MHz serial clock   

## MX25L32   
 JEDEC ID:  
 Byte1 : ManufacturerID(0xc2=Macronix)  
 Byte2 : MemoryType(0x20)  
 Byte3 : Capacity(2^0x16=2^22=0x400000=4M Byte=32M Bit)  
![mx25l32l06](https://user-images.githubusercontent.com/6020549/83100824-c4ef5780-a0eb-11ea-8070-2c26d633c7aa.jpg)

## MX25L64   
![mx25l6473e](https://user-images.githubusercontent.com/6020549/81268559-0eb3c780-9083-11ea-8763-71759eb664b2.jpg)

## MX25L128   
![mx25l12835f](https://user-images.githubusercontent.com/6020549/81371510-04e99d00-9133-11ea-94f7-3fdac64b8e38.jpg)

---

# Eon Silicon Solution   

|Device|# of Bytes|Address range|# of 4K-Sectors|# of 32K-Blocks|# of 64K-Blocks|JEDEC ID|
|:---|:---|:---|:---|:---|:---|:---|
|EN25Q32B|4M|0x3FFFFF|1024|128|64|1C-30-16|
|EN25QH64|8M|0x7FFFFF|2048|256|128|1C-70-17|

## EN25Q32B   
![en25q32b](https://user-images.githubusercontent.com/6020549/113461820-29401d80-9459-11eb-8eb8-d59331381e5c.jpg)

## EN25QH64   
![en25qh64](https://user-images.githubusercontent.com/6020549/85917565-22ff8e00-b896-11ea-8352-3aa9c55aafbb.jpg)

---

# Note   
I tested these.   
But I couldn't get it working.   
- GD25Q64   
- SST25VF016B   
- SST25VF032B   
