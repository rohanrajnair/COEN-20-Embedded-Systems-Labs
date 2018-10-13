//
//  main.cpp
//  LAB1
//
//  Created by Rohan Nair on 1/16/18.
//  Copyright © 2018 Rohan Nair. All rights reserved.
//

#include <iostream>
#include "lab1.hpp" 

using namespace std;

int main(){
    int bin1[8];
    int bin2[8];
    int bin3[8];
    
    float num = -1;
    Dec2Bin(num, bin1);
    cout << "Test #1: -1" << endl;
    cout << endl;
    cout << "Binary: " << bin1[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin1[i] << " ";
    }
    cout << "Twos Complement: ";
    TwosComplement(bin1,bin2);
    cout << bin2[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin2[i] << " ";
    }
    cout << "Decimal: ";
    cout << Bin2Dec(bin1) << endl;
    cout << endl;
    
    num = 0;
    Dec2Bin(num, bin1);
    cout << "Test #1: 0" << endl;
    cout << endl;
    cout << "Binary: " << bin1[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin1[i] << " ";
    }
    cout << "Twos Complement: ";
    TwosComplement(bin1,bin2);
    cout << bin2[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin2[i] << " ";
    }
    cout << "Decimal: ";
    cout << Bin2Dec(bin1) << endl;
    
    cout << endl;
    
    num = 0.01;
    Dec2Bin(num, bin1);
    cout << "Test #3: 0.01" << endl;
    cout << endl;
    cout << "Binary: " << bin1[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin1[i] << " ";
    }
    cout << "Twos Complement: ";
    TwosComplement(bin1,bin2);
    cout << bin2[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin2[i] << " ";
    }
    cout << "Decimal: ";
    cout << Bin2Dec(bin1) << endl;
    cout << endl;
    
    num = 0.03;
    Dec2Bin(num, bin1);
    cout << "Test #4: 0.03" << endl;
    cout << endl;
    cout << "Binary: " << bin1[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin1[i] << " ";
    }
    cout << "Twos Complement: ";
    TwosComplement(bin1,bin2);
    cout << bin2[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin2[i] << " ";
    }
    cout << "Decimal: ";
    cout << Bin2Dec(bin1) << endl;
    cout << endl;
    
    num = 0.07;
    Dec2Bin(num, bin1);
    cout << "Test #5: 0.07" << endl;
    cout << endl;
    cout << "Binary: " << bin1[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin1[i] << " ";
    }
    cout << "Twos Complement: ";
    TwosComplement(bin1,bin2);
    cout << bin2[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin2[i] << " ";
    }
    cout << "Decimal: ";
    cout << Bin2Dec(bin1) << endl;
    
    cout << endl;
    
    num = 0.1;
    Dec2Bin(num, bin1);
    cout << "Test #6: 0.1" << endl;
    cout << endl;
    cout << "Binary: " << bin1[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin1[i] << " ";
    }
    cout << "Twos Complement: ";
    TwosComplement(bin1,bin2);
    cout << bin2[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin2[i] << " ";
    }
    cout << "Decimal: ";
    cout << Bin2Dec(bin1) << endl;
    
    cout << endl;
    
    num = 0.3;
    Dec2Bin(num, bin1);
    cout << "Test #7: 0.3" << endl;
    cout << endl;
    cout << "Binary: " << bin1[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin1[i] << " ";
    }
    cout << "Twos Complement: ";
    TwosComplement(bin1,bin2);
    cout << bin2[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin2[i] << " ";
    }
    cout << "Decimal: ";
    cout << Bin2Dec(bin1) << endl;
    
    cout << endl;
    
    num = 0.7;
    Dec2Bin(num, bin1);
    cout << "Test #8: 0.7" << endl;
    cout << endl;
    cout << "Binary: " << bin1[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin1[i] << " ";
    }
    cout << "Twos Complement: ";
    TwosComplement(bin1,bin2);
    cout << bin2[7] << " . ";
    for (int i = 6; i >=0; --i){
        cout << bin2[i] << " ";
    }
    cout << "Decimal: ";
    cout << Bin2Dec(bin1) << endl;
}



