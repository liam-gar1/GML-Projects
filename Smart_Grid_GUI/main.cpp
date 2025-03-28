#include <stdio.h>
#include <tchar.h>
#include "SerialClass.h"	// Library described above
#include <string>
#include <iostream>
#include <fstream>
using namespace std;

Serial::Serial(const char *portName)
{
    //We're not yet connected
    this->connected = false;

    //Try to connect to the given port throuh CreateFile
    this->hSerial = CreateFile(portName,
            GENERIC_READ | GENERIC_WRITE,
            0,
            NULL,
            OPEN_EXISTING,
            FILE_ATTRIBUTE_NORMAL,
            NULL);

    //Check if the connection was successfull
    if(this->hSerial==INVALID_HANDLE_VALUE)
    {
        //If not success full display an Error
        if(GetLastError()==ERROR_FILE_NOT_FOUND){

            //Print Error if neccessary
            printf("ERROR: Handle was not attached. Reason: %s not available.\n", portName);

        }
        else
        {
            printf("ERROR!!!");
        }
    }
    else
    {
        //If connected we try to set the comm parameters
        DCB dcbSerialParams = {0};

        //Try to get the current
        if (!GetCommState(this->hSerial, &dcbSerialParams))
        {
            //If impossible, show an error
            printf("failed to get current serial parameters!");
        }
        else
        {
            //Define serial connection parameters for the arduino board
            dcbSerialParams.BaudRate=CBR_115200;
            dcbSerialParams.ByteSize=8;
            dcbSerialParams.StopBits=ONESTOPBIT;
            dcbSerialParams.Parity=NOPARITY;
            //Setting the DTR to Control_Enable ensures that the Arduino is properly
            //reset upon establishing a connection
            dcbSerialParams.fDtrControl = DTR_CONTROL_ENABLE;

             //Set the parameters and check for their proper application
             if(!SetCommState(hSerial, &dcbSerialParams))
             {
                printf("ALERT: Could not set Serial Port parameters");
             }
             else
             {
                 //If everything went fine we're connected
                 this->connected = true;
                 //Flush any remaining characters in the buffers 
                 PurgeComm(this->hSerial, PURGE_RXCLEAR | PURGE_TXCLEAR);
                 //We wait 2s as the arduino board will be reseting
                 Sleep(ARDUINO_WAIT_TIME);
             }
        }
    }

}

Serial::~Serial()
{
    //Check if we are connected before trying to disconnect
    if(this->connected)
    {
        //We're no longer connected
        this->connected = false;
        //Close the serial handler
        CloseHandle(this->hSerial);
    }
}

int Serial::ReadData(char *buffer, unsigned int nbChar)
{
    //Number of bytes we'll have read
    DWORD bytesRead;
    //Number of bytes we'll really ask to read
    unsigned int toRead;

    //Use the ClearCommError function to get status info on the Serial port
    ClearCommError(this->hSerial, &this->errors, &this->status);

    //Check if there is something to read
    if(this->status.cbInQue>0)
    {
        //If there is we check if there is enough data to read the required number
        //of characters, if not we'll read only the available characters to prevent
        //locking of the application.
        if(this->status.cbInQue>nbChar)
        {
            toRead = nbChar;
        }
        else
        {
            toRead = this->status.cbInQue;
        }

        //Try to read the require number of chars, and return the number of read bytes on success
        if(ReadFile(this->hSerial, buffer, toRead, &bytesRead, NULL) )
        {
            return bytesRead;
        }

    }

    //If nothing has been read, or that an error was detected return 0
    return 0;

}


bool Serial::WriteData(const char *buffer, unsigned int nbChar)
{
    DWORD bytesSend;

    //Try to write the buffer on the Serial port
    if(!WriteFile(this->hSerial, (void *)buffer, nbChar, &bytesSend, 0))
    {
        //In case it don't work get comm error and return false
        ClearCommError(this->hSerial, &this->errors, &this->status);

        return false;
    }
    else
        return true;
}

bool Serial::IsConnected()
{
    //Simply return the connection status
    return this->connected;
}

// application reads from the specified serial port and reports the collected data
int _tmain(int argc, _TCHAR* argv[])
{
	printf("Welcome to the serial test app!\n");

	Serial* SP = new Serial("\\\\.\\COM3");    // adjust as needed

	if (SP->IsConnected())
		printf("We're connected\n");

	char incomingData[256] = "";			// don't forget to pre-allocate memory
	//printf("%s\n",incomingData);
	int dataLength = 255;
	int readResult = 0;

    char cwd[1024];  // Buffer to store the directory path
    if (_getcwd(cwd, sizeof(cwd)) != NULL) {
        printf("Current working directory: %s\n", cwd);
    } else {
        perror("_getcwd() error");
    }
    
	while(SP->IsConnected())
	{
		readResult = SP->ReadData(incomingData,dataLength);
		// printf("Bytes read: (0 means no data available) %i\n",readResult);
        incomingData[readResult] = 0;
        //incomingData[readResult] = '\n';
            
        // Remove whitespace from incomingData
        int writeIndex = 0;
        ///for (int i = 0; i < readResult; ++i) {
        for (int i = 0; i < 8; ++i) {
            if (!std::isspace(incomingData[i])) {
                incomingData[writeIndex++] = incomingData[i];
            }
        }

        // Null-terminate the string to ensure it's properly ended
        incomingData[writeIndex] = '\0';

        /*
        // Shift the string contents one position to the right to make room for the newline
        if (writeIndex < 255) { // Ensure there's room for the newline and the null terminator
            for (int i = writeIndex; i >= 0; --i) {
                incomingData[i + 1] = incomingData[i];
            }
            // Insert a newline character at the beginning of the string
            incomingData[0] = '\n';
        }*/

        /*
        char incomingData2[256]="";
        incomingData2[0]='\n';
        incomingData2[1]=incomingData[0];
        incomingData2[2]=incomingData[1];
        incomingData2[3]=incomingData[2];
        incomingData2[4]=incomingData[3];*/

        //ofstream MyFile("C:\\Users\\user\\Desktop\\Favourite\\Back-Up Code\\Programming\\VBA\\Arduino.txt");
        //ofstream MyFile("C:\\Users\\user\\AppData\\Local\\Smart_Systems_GUI\\Load.txt", ios::app);
        //ofstream MyFile("C:\\Users\\user\\AppData\\Local\\Smart_Systems_GUI\\Load.txt");
        //MyFile << '\n' << incomingData;
        //ofstream MyFile("C:\\Users\\user\\AppData\\Local\\Smart_Systems_GUI\\Load.txt", ios::app);
        ofstream MyFile(std::string(cwd)+"\\Files\\Load.txt", ios::app);
        MyFile << '\n';
        if(strlen(incomingData)!=0){
            MyFile << incomingData;
        }

        //MyFile << 16669.24;
        MyFile.close();
        printf("\n%s",incomingData);

		Sleep(495);
	}
	return 0;
}