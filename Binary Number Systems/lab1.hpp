//
//  lab1.hpp
//  LAB1
//
//  Created by Rohan Nair on 1/16/18.
//  Copyright © 2018 Rohan Nair. All rights reserved.
//

#ifndef lab1_hpp
#define lab1_hpp
#include <string>
#include <math.h>
#include <stdio.h>


using namespace std;

void TwosComplement(const int input[8], int output[8]){
    
    int i = 0;
    while (input[i] == 0){ //find the first occurance of '1'
        ++i;
    }
    for (int j = 7; j > i; --j){ //swap the rest of the bits
        if (input[j] == 0){
            output[j] = 1;
        }
        else{
            output[j] = 0;
        }
    }
    for (int k = 0; k <=i; ++k){ //preserve all bits up until first '1'
        output[k] = input[k];
    }
}



void Dec2Bin(const float x, int bin[8]){
    if (x < 0){
        TwosComplement(bin, bin); //use two's complement if negative
    }
    float num = 128*x + 128; //multiply x by 128 and add 128 so that it can be represented asa whole 8-bit binary #
    int temp = round(num);
    for (int i = 0; i <=7; ++i){ //make every element '0' to begin with
        bin[i] = 0;
    }
    int i = 0; //decimal to binary conversion (repeated division, take the remainder)
    while (temp > 0){/////////////////
        bin[i] = temp % 2;
//        cout << "temp " << temp << endl;
        temp = temp / 2;
        ++i;
    }
//    cout << "temp " << temp << endl;
//    int next_bit = temp % 2;
//    cout << "next bit " << next_bit << endl;
//    if (next_bit == 1){
//        if (bin[0] == 1){
//            addone(bin);
//        }
//        else{
//            bin[0] = 1;
//        }
//    }
    if (bin[7] == 0){
        bin[7] = 1; //correct first bit
    }
    else{
        bin[7] = 0;
    }

}

float Bin2Dec(const int bin[8]){
    float polynomial = 0;
    for (int i = 7; i >=0; --i){
        polynomial = 2*polynomial + bin[i]; //polynomial evaluation, same as b0 + 2(b1 + 2(b2 + 2(b3 .....
    }
    if (bin[7] == 1){
        return -polynomial/128; //identify if # was originally positive or negative
    }
    else{
        return polynomial/128; 
    }
}






#endif /* lab1_hpp */
