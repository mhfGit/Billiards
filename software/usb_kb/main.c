/*---------------------------------------------------------------------------
  --      main.c                                                    	   --
  --      Christine Chen                                                   --
  --      Ref. DE2-115 Demonstrations by Terasic Technologies Inc.         --
  --      Fall 2014                                                        --
  --                                                                       --
  --      For use with ECE 298 Experiment 7                                --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <io.h>
#include <fcntl.h>

#include "system.h"
#include "alt_types.h"
#include <unistd.h>  // usleep 
#include "sys/alt_irq.h"
#include "io_handler.h"

#include "cy7c67200.h"
#include "usb.h"
#include "lcp_cmd.h"
#include "lcp_data.h"
#include <math.h>



unsigned int coordConcat(unsigned short x, unsigned short y)
{
	unsigned int concatTotal = x;
	concatTotal <<= 10;
	concatTotal |= y;
	return concatTotal;
}


//----------------------------------------------------------------------------------------//
//
//                                Main function
//
//----------------------------------------------------------------------------------------//
int main(void)
{
	IO_init();

	/*while(1)
	{
		IO_write(HPI_MAILBOX,COMM_EXEC_INT);
		printf("[ERROR]:routine mailbox data is %x\n",IO_read(HPI_MAILBOX));
		//UsbWrite(0xc008,0x000f);
		//UsbRead(0xc008);
		usleep(10*10000);
	}*/

	alt_u16 intStat;
	alt_u16 usb_ctl_val;
	static alt_u16 ctl_reg = 0;
	static alt_u16 no_device = 0;
	alt_u16 fs_device = 0;
	volatile int keycode = 0;
	alt_u8 toggle = 0;
	alt_u8 data_size;
	alt_u8 hot_plug_count;
	alt_u16 code;

	printf("USB keyboard setup...\n\n");

	//----------------------------------------SIE1 initial---------------------------------------------------//
	USB_HOT_PLUG:
	UsbSoftReset();

	// STEP 1a:
	UsbWrite (HPI_SIE1_MSG_ADR, 0);
	UsbWrite (HOST1_STAT_REG, 0xFFFF);

	/* Set HUSB_pEOT time */
	UsbWrite(HUSB_pEOT, 600); // adjust the according to your USB device speed

	usb_ctl_val = SOFEOP1_TO_CPU_EN | RESUME1_TO_HPI_EN;// | SOFEOP1_TO_HPI_EN;
	UsbWrite(HPI_IRQ_ROUTING_REG, usb_ctl_val);

	intStat = A_CHG_IRQ_EN | SOF_EOP_IRQ_EN ;
	UsbWrite(HOST1_IRQ_EN_REG, intStat);
	// STEP 1a end

	// STEP 1b begin
	UsbWrite(COMM_R0,0x0000);//reset time
	UsbWrite(COMM_R1,0x0000);  //port number
	UsbWrite(COMM_R2,0x0000);  //r1
	UsbWrite(COMM_R3,0x0000);  //r1
	UsbWrite(COMM_R4,0x0000);  //r1
	UsbWrite(COMM_R5,0x0000);  //r1
	UsbWrite(COMM_R6,0x0000);  //r1
	UsbWrite(COMM_R7,0x0000);  //r1
	UsbWrite(COMM_R8,0x0000);  //r1
	UsbWrite(COMM_R9,0x0000);  //r1
	UsbWrite(COMM_R10,0x0000);  //r1
	UsbWrite(COMM_R11,0x0000);  //r1
	UsbWrite(COMM_R12,0x0000);  //r1
	UsbWrite(COMM_R13,0x0000);  //r1
	UsbWrite(COMM_INT_NUM,HUSB_SIE1_INIT_INT); //HUSB_SIE1_INIT_INT
	IO_write(HPI_MAILBOX,COMM_EXEC_INT);

	while (!(IO_read(HPI_STATUS) & 0xFFFF) )  //read sie1 msg register
	{
	}
	while (IO_read(HPI_MAILBOX) != COMM_ACK)
	{
		printf("[ERROR]:routine mailbox data is %x\n",IO_read(HPI_MAILBOX));
		goto USB_HOT_PLUG;
	}
	// STEP 1b end

	printf("STEP 1 Complete");
	// STEP 2 begin
	UsbWrite(COMM_INT_NUM,HUSB_RESET_INT); //husb reset
	UsbWrite(COMM_R0,0x003c);//reset time
	UsbWrite(COMM_R1,0x0000);  //port number
	UsbWrite(COMM_R2,0x0000);  //r1
	UsbWrite(COMM_R3,0x0000);  //r1
	UsbWrite(COMM_R4,0x0000);  //r1
	UsbWrite(COMM_R5,0x0000);  //r1
	UsbWrite(COMM_R6,0x0000);  //r1
	UsbWrite(COMM_R7,0x0000);  //r1
	UsbWrite(COMM_R8,0x0000);  //r1
	UsbWrite(COMM_R9,0x0000);  //r1
	UsbWrite(COMM_R10,0x0000);  //r1
	UsbWrite(COMM_R11,0x0000);  //r1
	UsbWrite(COMM_R12,0x0000);  //r1
	UsbWrite(COMM_R13,0x0000);  //r1

	IO_write(HPI_MAILBOX,COMM_EXEC_INT);

	while (IO_read(HPI_MAILBOX) != COMM_ACK)
	{
		printf("[ERROR]:routine mailbox data is %x\n",IO_read(HPI_MAILBOX));
		goto USB_HOT_PLUG;
	}
	// STEP 2 end

	ctl_reg = USB1_CTL_REG;
	no_device = (A_DP_STAT | A_DM_STAT);
	fs_device = A_DP_STAT;
	usb_ctl_val = UsbRead(ctl_reg);

	if (!(usb_ctl_val & no_device))
	{
		for(hot_plug_count = 0 ; hot_plug_count < 5 ; hot_plug_count++)
		{
			usleep(5*1000);
			usb_ctl_val = UsbRead(ctl_reg);
			if(usb_ctl_val & no_device) break;
		}
		if(!(usb_ctl_val & no_device))
		{
			printf("\n[INFO]: no device is present in SIE1!\n");
			printf("[INFO]: please insert a USB keyboard in SIE1!\n");
			while (!(usb_ctl_val & no_device))
			{
				usb_ctl_val = UsbRead(ctl_reg);
				if(usb_ctl_val & no_device)
					goto USB_HOT_PLUG;

				usleep(2000);
			}
		}
	}
	else
	{
		/* check for low speed or full speed by reading D+ and D- lines */
		if (usb_ctl_val & fs_device)
		{
			printf("[INFO]: full speed device\n");
		}
		else
		{
			printf("[INFO]: low speed device\n");
		}
	}



	// STEP 3 begin
	//------------------------------------------------------set address -----------------------------------------------------------------
	UsbSetAddress();

	while (!(IO_read(HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		UsbSetAddress();
		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IO_write(HPI_ADDR,0x0506); // i
	printf("[ENUM PROCESS]:step 3 TD Status Byte is %x\n",IO_read(HPI_DATA));

	IO_write(HPI_ADDR,0x0508); // n
	usb_ctl_val = IO_read(HPI_DATA);
	printf("[ENUM PROCESS]:step 3 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03) // retries occurred
	{
		usb_ctl_val = UsbGetRetryCnt();

		goto USB_HOT_PLUG;
	}

	printf("------------[ENUM PROCESS]:set address done!---------------\n");

	// STEP 4 begin
	//-------------------------------get device descriptor-1 -----------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbGetDeviceDesc1(); 	// Get Device Descriptor -1

	//usleep(10*1000);
	while (!(IO_read(HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetDeviceDesc1();
		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IO_write(HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 4 TD Status Byte is %x\n",IO_read(HPI_DATA));

	IO_write(HPI_ADDR,0x0508);
	usb_ctl_val = IO_read(HPI_DATA);
	printf("[ENUM PROCESS]:step 4 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}

	printf("---------------[ENUM PROCESS]:get device descriptor-1 done!-----------------\n");


	//--------------------------------get device descriptor-2---------------------------------------------//
	//get device descriptor
	// TASK: Call the appropriate function for this step.
	UsbGetDeviceDesc2(); 	// Get Device Descriptor -2

	//if no message
	while (!(IO_read(HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		//resend the get device descriptor
		//get device descriptor
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetDeviceDesc2();
		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IO_write(HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 4 TD Status Byte is %x\n",IO_read(HPI_DATA));

	IO_write(HPI_ADDR,0x0508);
	usb_ctl_val = IO_read(HPI_DATA);
	printf("[ENUM PROCESS]:step 4 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}

	printf("------------[ENUM PROCESS]:get device descriptor-2 done!--------------\n");


	// STEP 5 begin
	//-----------------------------------get configuration descriptor -1 ----------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbGetConfigDesc1(); 	// Get Configuration Descriptor -1

	//if no message
	while (!(IO_read(HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		//resend the get device descriptor
		//get device descriptor

		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetConfigDesc1();
		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IO_write(HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 5 TD Status Byte is %x\n",IO_read(HPI_DATA));

	IO_write(HPI_ADDR,0x0508);
	usb_ctl_val = IO_read(HPI_DATA);
	printf("[ENUM PROCESS]:step 5 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}
	printf("------------[ENUM PROCESS]:get configuration descriptor-1 pass------------\n");

	// STEP 6 begin
	//-----------------------------------get configuration descriptor-2------------------------------------//
	//get device descriptor
	// TASK: Call the appropriate function for this step.
	UsbGetConfigDesc2(); 	// Get Configuration Descriptor -2

	usleep(100*1000);
	//if no message
	while (!(IO_read(HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetConfigDesc2();
		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IO_write(HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 6 TD Status Byte is %x\n",IO_read(HPI_DATA));

	IO_write(HPI_ADDR,0x0508);
	usb_ctl_val = IO_read(HPI_DATA);
	printf("[ENUM PROCESS]:step 6 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}


	printf("-----------[ENUM PROCESS]:get configuration descriptor-2 done!------------\n");


	// ---------------------------------get device info---------------------------------------------//

	// TASK: Write the address to read from the memory for byte 7 of the interface descriptor to HPI_ADDR.
	IO_write(HPI_ADDR,0x056c);
	code = IO_read(HPI_DATA);
	code = code & 0x003;
	printf("\ncode = %x\n", code);

	if (code == 0x01)
	{
		printf("\n[INFO]:check TD rec data7 \n[INFO]:Keyboard Detected!!!\n\n");
	}
	else
	{
		printf("\n[INFO]:Keyboard Not Detected!!! \n\n");
	}

	// TASK: Write the address to read from the memory for the endpoint descriptor to HPI_ADDR.

	IO_write(HPI_ADDR,0x0576);
	IO_write(HPI_DATA,0x073F);
	IO_write(HPI_DATA,0x8105);
	IO_write(HPI_DATA,0x0003);
	IO_write(HPI_DATA,0x0008);
	IO_write(HPI_DATA,0xAC0A);
	UsbWrite(HUSB_SIE1_pCurrentTDPtr,0x0576); //HUSB_SIE1_pCurrentTDPtr

	//data_size = (IO_read(HPI_DATA)>>8)&0x0ff;
	//data_size = 0x08;//(IO_read(HPI_DATA))&0x0ff;
	//UsbPrintMem();
	IO_write(HPI_ADDR,0x057c);
	data_size = (IO_read(HPI_DATA))&0x0ff;
	printf("[ENUM PROCESS]:data packet size is %d\n",data_size);
	// STEP 7 begin
	//------------------------------------set configuration -----------------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbSetConfig();		// Set Configuration

	while (!(IO_read(HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbSetConfig();		// Set Configuration
		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IO_write(HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 7 TD Status Byte is %x\n",IO_read(HPI_DATA));

	IO_write(HPI_ADDR,0x0508);
	usb_ctl_val = IO_read(HPI_DATA);
	printf("[ENUM PROCESS]:step 7 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}

	printf("------------[ENUM PROCESS]:set configuration done!-------------------\n");

	//----------------------------------------------class request out ------------------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbClassRequest();

	while (!(IO_read(HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbClassRequest();
		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IO_write(HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 8 TD Status Byte is %x\n",IO_read(HPI_DATA));

	IO_write(HPI_ADDR,0x0508);
	usb_ctl_val = IO_read(HPI_DATA);
	printf("[ENUM PROCESS]:step 8 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}


	printf("------------[ENUM PROCESS]:class request out done!-------------------\n");

	// STEP 8 begin
	//----------------------------------get descriptor(class 0x21 = HID) request out --------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbGetHidDesc();

	while (!(IO_read(HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetHidDesc();
		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IO_write(HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 8 TD Status Byte is %x\n",IO_read(HPI_DATA));

	IO_write(HPI_ADDR,0x0508);
	usb_ctl_val = IO_read(HPI_DATA);
	printf("[ENUM PROCESS]:step 8 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}

	printf("------------[ENUM PROCESS]:get descriptor (class 0x21) done!-------------------\n");

	// STEP 9 begin
	//-------------------------------get descriptor (class 0x22 = report)-------------------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbGetReportDesc();
	//if no message
	while (!(IO_read(HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetReportDesc();
		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IO_write(HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]: step 9 TD Status Byte is %x\n",IO_read(HPI_DATA));

	IO_write(HPI_ADDR,0x0508);
	usb_ctl_val = IO_read(HPI_DATA);
	printf("[ENUM PROCESS]: step 9 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}

	printf("---------------[ENUM PROCESS]:get descriptor (class 0x22) done!----------------\n");

	unsigned short oneballx = 404;
	unsigned short onebally = 229;
	unsigned short twoballx = 419;
	unsigned short twobally = 237;
	unsigned short threeballx = 434;
	unsigned short threebally = 213;
	unsigned short fourballx = 449;
	unsigned short fourbally = 253;
	unsigned short fiveballx = 464;
	unsigned short fivebally = 197;
	unsigned short sixballx = 464;
	unsigned short sixbally = 245;
	unsigned short sevenballx = 449;
	unsigned short sevenbally = 221;
	unsigned short eightballx = 434;
	unsigned short eightbally = 229;
	unsigned short nineballx = 419;
	unsigned short ninebally = 221;
	unsigned short tenballx = 434;
	unsigned short tenbally = 245;
	unsigned short elevenballx = 449;
	unsigned short elevenbally = 205;
	unsigned short twelveballx = 464;
	unsigned short twelvebally = 261;
	unsigned short thirteenballx = 464;
	unsigned short thirteenbally = 213;
	unsigned short fourteenballx = 449;
	unsigned short fourteenbally = 237;
	unsigned short fifteenballx = 464;
	unsigned short fifteenbally = 229;
	unsigned short cueballx = 150;
	unsigned short cuebally = 229;
	unsigned short poolstickx = 214;
	unsigned short poolsticky = 163;

	int pressed = 0;
	int balldiameter = 15;
	int poolstickAx = 35;
	int poolstickAy = 3;
	int poolstickB = 35;
	int poolstickCx = 3;
	int poolstickCy = 50;
	int diagGap = 6;
	int dirConfirm = 0;
	int speedConfirm = 0;
	int power = 0;
	int powerMod = 3;

	int frictionCounter = 0;
	int friction = -1;
	int applyFrictionAfterFrames = 20;
	int gameState = 1; // 0 = GAME START / 1 = BEGIN TURN / 2 = BALL MOVE / 3 = END TURN

	volatile unsigned int *ONEBALL_PIO = (unsigned int*)0x150;
	volatile unsigned int *TWOBALL_PIO = (unsigned int*)0x140;
	volatile unsigned int *THREEBALL_PIO = (unsigned int*)0x130;
	volatile unsigned int *FOURBALL_PIO = (unsigned int*)0x120;
	volatile unsigned int *FIVEBALL_PIO = (unsigned int*)0x110;
	volatile unsigned int *SIXBALL_PIO = (unsigned int*)0x100;
	volatile unsigned int *SEVENBALL_PIO = (unsigned int*)0xf0;
	volatile unsigned int *EIGHTBALL_PIO = (unsigned int*)0xe0;
	volatile unsigned int *NINEBALL_PIO = (unsigned int*)0xd0;
	volatile unsigned int *TENBALL_PIO = (unsigned int*)0xc0;
	volatile unsigned int *ELEVENBALL_PIO = (unsigned int*)0xb0;
	volatile unsigned int *TWELVEBALL_PIO = (unsigned int*)0xa0;
	volatile unsigned int *THIRTEENBALL_PIO = (unsigned int*)0x90;
	volatile unsigned int *FOURTEENBALL_PIO = (unsigned int*)0x80;
	volatile unsigned int *FIFTEENBALL_PIO = (unsigned int*)0x70;
	volatile unsigned int *CUEBALL_PIO = (unsigned int*)0x60;
	volatile unsigned int *POOLSTICK_PIO = (unsigned int*)0x50;
	volatile unsigned int *RESET_PIO = (unsigned int*)0x40;
	volatile unsigned int *HW_SIG_PIO = (unsigned int*)0x30;
	volatile unsigned int *STICKDIRECTION_PIO = (unsigned int*)0x20;



	//-----------------------------------get keycode value------------------------------------------------//

	usleep(10000);
	while(1)
	{
		toggle++;
		IO_write(HPI_ADDR,0x0500); //the start address
		//data phase IN-1
		IO_write(HPI_DATA,0x051c); //500

		IO_write(HPI_DATA,0x000f & data_size);//2 data length

		IO_write(HPI_DATA,0x0291);//4 //endpoint 1
		if(toggle%2)
		{
			IO_write(HPI_DATA,0x0001);//6 //data 1
		}
		else
		{
			IO_write(HPI_DATA,0x0041);//6 //data 1
		}
		IO_write(HPI_DATA,0x0013);//8
		IO_write(HPI_DATA,0x0000);//a
		UsbWrite(HUSB_SIE1_pCurrentTDPtr,0x0500); //HUSB_SIE1_pCurrentTDPtr
		
		while (!(IO_read(HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
		{
			IO_write(HPI_ADDR,0x0500); //the start address
			//data phase IN-1
			IO_write(HPI_DATA,0x051c); //500

			IO_write(HPI_DATA,0x000f & data_size);//2 data length

			IO_write(HPI_DATA,0x0291);//4 //endpoint 1
			if(toggle%2)
			{
				IO_write(HPI_DATA,0x0001);//6 //data 1
			}
			else
			{
				IO_write(HPI_DATA,0x0041);//6 //data 1
			}
			IO_write(HPI_DATA,0x0013);//8
			IO_write(HPI_DATA,0x0000);//
			UsbWrite(HUSB_SIE1_pCurrentTDPtr,0x0500); //HUSB_SIE1_pCurrentTDPtr
			usleep(10*1000);
		}//end while



		usb_ctl_val = UsbWaitTDListDone();

		// packet starts from 0x051c, reading third byte
		// TASK: Write the address to read from the memory for byte 3 of the report descriptor to HPI_ADDR.
		IO_write(HPI_ADDR,0x051e); //the start address
		keycode = IO_read(HPI_DATA);
		printf("\nfirst two keycode values are %04x\n",keycode);
		IOWR(KEYCODE_BASE, 0, keycode & 0xff);


		usleep(200);//usleep(5000);
		usb_ctl_val = UsbRead(ctl_reg);

		if(!(usb_ctl_val & no_device))
		{
			//USB hot plug routine
			for(hot_plug_count = 0 ; hot_plug_count < 7 ; hot_plug_count++)
			{
				usleep(5*1000);
				usb_ctl_val = UsbRead(ctl_reg);
				if(usb_ctl_val & no_device) break;
			}
			if(!(usb_ctl_val & no_device))
			{
				printf("\n[INFO]: the keyboard has been removed!!! \n");
				printf("[INFO]: please insert again!!! \n");
			}
		}

		while (!(usb_ctl_val & no_device))
		{

			usb_ctl_val = UsbRead(ctl_reg);
			usleep(5*1000);
			usb_ctl_val = UsbRead(ctl_reg);
			usleep(5*1000);
			usb_ctl_val = UsbRead(ctl_reg);
			usleep(5*1000);

			if(usb_ctl_val & no_device)
				goto USB_HOT_PLUG;

			usleep(200);
		}

		if(gameState == 1  && speedConfirm == 1)
		{
			speedConfirm = 0;
			dirConfirm = 0;
			frictionCounter = 0;
		}

		if(gameState == 3)
			gameState = 1;

		if(keycode == 0x002c && pressed == 0)
		{
			pressed = 1;
			dirConfirm = 1;
		}
		else if(keycode == 0x0000)
		{
			pressed = 0;
		}


		if(keycode == 0x0028 && dirConfirm == 1 && pressed == 0)
		{
			pressed = 1;
			speedConfirm = 1;
			gameState = 2;
		}
		else if(keycode == 0x0000)
		{
			pressed = 0;
		}

		if(gameState == 2)
		{
			if(*STICKDIRECTION_PIO == 0)
				cueballx += power;
			else if(*STICKDIRECTION_PIO == 1)
			{
				cueballx += power;
				cuebally += (power * (2.0/3));
			}
			else if(*STICKDIRECTION_PIO == 2)
			{
				cuebally += (power * (2.0/3));
			}
			else if(*STICKDIRECTION_PIO == 3)
			{
				cueballx -= power;
				cuebally += (power * (2.0/3));
			}
			else if(*STICKDIRECTION_PIO == 4)
			{
				cueballx -= power;
			}
			else if(*STICKDIRECTION_PIO == 5)
			{
				cueballx -= power;
				cuebally -= (power * (2.0/3));
			}
			else if(*STICKDIRECTION_PIO == 6)
			{
				cuebally -= (power * (2.0/3));
			}
			else if(*STICKDIRECTION_PIO == 7)
			{
				cueballx += power;
				cuebally -= (power * (2.0/3));
			}
		}

		if(gameState == 2)
		{
			frictionCounter++;
			if((frictionCounter % applyFrictionAfterFrames) == 0)
			{
				power += friction;
				if(power <= 0)
					gameState = 3;
			}
		}

		if(keycode == 0x004f && pressed == 0 && dirConfirm == 0 && gameState == 1)
		{
			pressed = 1;
			if(*STICKDIRECTION_PIO == 0)
			{
				*STICKDIRECTION_PIO = 1;
				poolstickx = cueballx - poolstickB + diagGap;
				poolsticky = cuebally - poolstickB + diagGap;
			}
			else if(*STICKDIRECTION_PIO == 1)
			{
				*STICKDIRECTION_PIO = 2;
				poolstickx = cueballx + balldiameter / 2;
				poolsticky = cuebally - poolstickCy;
			}
			else if(*STICKDIRECTION_PIO == 2)
			{
				*STICKDIRECTION_PIO = 3;
				poolstickx = cueballx + balldiameter - diagGap;
				poolsticky = cuebally - poolstickB + diagGap;
			}
			else if(*STICKDIRECTION_PIO == 3)
			{
				*STICKDIRECTION_PIO = 4;
				poolstickx = cueballx + balldiameter;
				poolsticky = cuebally + balldiameter / 2;
			}
			else if(*STICKDIRECTION_PIO == 4)
			{
				*STICKDIRECTION_PIO = 5;
				poolstickx = cueballx + balldiameter - diagGap;
				poolsticky = cuebally + balldiameter - diagGap;
			}
			else if(*STICKDIRECTION_PIO == 5)
			{
				*STICKDIRECTION_PIO = 6;
				poolstickx = cueballx + balldiameter / 2;
				poolsticky = cuebally + balldiameter;
			}
			else if(*STICKDIRECTION_PIO == 6)
			{
				*STICKDIRECTION_PIO = 7;
				poolstickx = cueballx - poolstickB + diagGap;
				poolsticky = cuebally + balldiameter - diagGap;
			}
			else
			{
				*STICKDIRECTION_PIO = 0;
				poolstickx = cueballx - poolstickAx;
				poolsticky = cuebally + balldiameter / 2;
			}
		}
		else if(keycode == 0x0050 && pressed == 0 && dirConfirm == 0 && gameState == 1)
		{
			pressed = 1;
			if(*STICKDIRECTION_PIO == 0)
			{
				*STICKDIRECTION_PIO = 7;
				poolstickx = cueballx - poolstickB + diagGap;
				poolsticky = cuebally + balldiameter - diagGap;
			}
			else if(*STICKDIRECTION_PIO == 1)
			{
				*STICKDIRECTION_PIO = 0;
				poolstickx = cueballx - poolstickAx;
				poolsticky = cuebally + balldiameter / 2;
			}
			else if(*STICKDIRECTION_PIO == 2)
			{
				*STICKDIRECTION_PIO = 1;
				poolstickx = cueballx - poolstickB + diagGap;
				poolsticky = cuebally - poolstickB + diagGap;
			}
			else if(*STICKDIRECTION_PIO == 3)
			{
				*STICKDIRECTION_PIO = 2;
				poolstickx = cueballx + balldiameter / 2;
				poolsticky = cuebally - poolstickCy;
			}
			else if(*STICKDIRECTION_PIO == 4)
			{
				*STICKDIRECTION_PIO = 3;
				poolstickx = cueballx + balldiameter - diagGap;
				poolsticky = cuebally - poolstickB + diagGap;
			}
			else if(*STICKDIRECTION_PIO == 5)
			{
				*STICKDIRECTION_PIO = 4;
				poolstickx = cueballx + balldiameter;
				poolsticky = cuebally + balldiameter / 2;
			}
			else if(*STICKDIRECTION_PIO == 6)
			{
				*STICKDIRECTION_PIO = 5;
				poolstickx = cueballx + balldiameter - diagGap;
				poolsticky = cuebally + balldiameter - diagGap;
			}
			else
			{
				*STICKDIRECTION_PIO = 6;
				poolstickx = cueballx + balldiameter / 2;
				poolsticky = cuebally + balldiameter;
			}
		}
		else if(keycode == 0x0000)
		{
			pressed = 0;
		}

		if(keycode == 0x001d && pressed == 0 && dirConfirm == 1 && gameState == 1)
		{
			pressed = 1;
			if(power == 5)
				continue;
			else
			{
				power++;
				if(*STICKDIRECTION_PIO == 0)
				{
					poolstickx -= powerMod;
				}
				else if(*STICKDIRECTION_PIO == 1)
				{
					poolstickx -= powerMod / sqrt(2.0);
					poolsticky -= (powerMod / sqrt(2.0)) * (2.0/3);
				}
				else if(*STICKDIRECTION_PIO == 2)
				{
					poolsticky -= powerMod;
				}
				else if(*STICKDIRECTION_PIO == 3)
				{
					poolstickx += powerMod / sqrt(2.0);
					poolsticky -= (powerMod / sqrt(2.0)) * (2.0/3);
				}
				else if(*STICKDIRECTION_PIO == 4)
				{
					poolstickx += powerMod;
				}
				else if(*STICKDIRECTION_PIO == 5)
				{
					poolstickx += powerMod / sqrt(2.0);
					poolsticky += (powerMod / sqrt(2.0)) * (2.0/3);
				}
				else if(*STICKDIRECTION_PIO == 6)
				{
					poolsticky += powerMod;
				}
				else
				{
					poolstickx -= powerMod / sqrt(2.0);
					poolsticky += (powerMod / sqrt(2.0)) * (2.0/3);
				}
			}
		}
		else if(keycode == 0x0000)
		{
			pressed = 0;
		}


		if(keycode == 0x001b && pressed == 0 && dirConfirm == 1 && gameState == 1)
		{
			pressed = 1;
			if(power == 0)
				continue;
			else
			{
				power--;
				if(*STICKDIRECTION_PIO == 0)
				{
					poolstickx += powerMod;
				}
				else if(*STICKDIRECTION_PIO == 1)
				{
					poolstickx += powerMod / sqrt(2.0);
					poolsticky += (powerMod / sqrt(2.0)) * (2.0/3);
				}
				else if(*STICKDIRECTION_PIO == 2)
				{
					poolsticky += powerMod;
				}
				else if(*STICKDIRECTION_PIO == 3)
				{
					poolstickx -= powerMod / sqrt(2.0);
					poolsticky += (powerMod / sqrt(2.0)) * (2.0/3);
				}
				else if(*STICKDIRECTION_PIO == 4)
				{
					poolstickx -= powerMod;
				}
				else if(*STICKDIRECTION_PIO == 5)
				{
					poolstickx -= powerMod / sqrt(2.0);
					poolsticky -= (powerMod / sqrt(2.0)) * (2.0/3);
				}
				else if(*STICKDIRECTION_PIO == 6)
				{
					poolsticky -= powerMod;
				}
				else
				{
					poolstickx += powerMod / sqrt(2.0);
					poolsticky -= (powerMod / sqrt(2.0)) * (2.0/3);
				}
			}
		}
		else if(keycode == 0x0000)
		{
			pressed = 0;
		}


		if(keycode == 0x0015)
		{
			power = 0;
			gameState = 1;
			*STICKDIRECTION_PIO = 0;
			oneballx = 404;
			onebally = 229;
			twoballx = 419;
			twobally = 237;
			threeballx = 434;
			threebally = 213;
			fourballx = 449;
			fourbally = 253;
			fiveballx = 464;
			fivebally = 197;
			sixballx = 464;
			sixbally = 245;
			sevenballx = 449;
			sevenbally = 221;
			eightballx = 434;
			eightbally = 229;
			nineballx = 419;
			ninebally = 221;
			tenballx = 434;
			tenbally = 245;
			elevenballx = 449;
			elevenbally = 205;
			twelveballx = 464;
			twelvebally = 261;
			thirteenballx = 464;
			thirteenbally = 213;
			fourteenballx = 449;
			fourteenbally = 237;
			fifteenballx = 464;
			fifteenbally = 229;
			cueballx = 150;
			cuebally = 229;
			poolstickx = 214;
			poolsticky = 163;
		}

		*ONEBALL_PIO = coordConcat(oneballx, onebally);
		*TWOBALL_PIO = coordConcat(twoballx, twobally);
		*THREEBALL_PIO = coordConcat(threeballx, threebally);
		*FOURBALL_PIO = coordConcat(fourballx, fourbally);
		*FIVEBALL_PIO = coordConcat(fiveballx, fivebally);
		*SIXBALL_PIO = coordConcat(sixballx, sixbally);
		*SEVENBALL_PIO = coordConcat(sevenballx, sevenbally);
		*EIGHTBALL_PIO = coordConcat(eightballx, eightbally);
		*NINEBALL_PIO = coordConcat(nineballx, ninebally);
		*TENBALL_PIO = coordConcat(tenballx, tenbally);
		*ELEVENBALL_PIO = coordConcat(elevenballx, elevenbally);
		*TWELVEBALL_PIO = coordConcat(twelveballx, twelvebally);
		*THIRTEENBALL_PIO = coordConcat(thirteenballx, thirteenbally);
		*FOURTEENBALL_PIO = coordConcat(fourteenballx, fourteenbally);
		*FIFTEENBALL_PIO = coordConcat(fifteenballx, fifteenbally);
		*CUEBALL_PIO = coordConcat(cueballx, cuebally);
		*POOLSTICK_PIO = coordConcat(poolstickx, poolsticky);



		while(*HW_SIG_PIO == 0);


	}//end while

	return 0;
}

