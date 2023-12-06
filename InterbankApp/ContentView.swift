//
//  ContentView.swift
//  InterbankApp
//
//  Created by Rodrigo Adauto Ortiz on 5/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var cardNumber: String = ""
    @State var DNI: String = ""
    @State var identificationType: String = "DNI"
    @State var password: String = ""
    @State private var eyeSlash: Bool = true
    
    
    var body: some View {
        VStack {
            Spacer()
            Image("interbank_logo", bundle: nil)
                .resizable()
                .scaledToFit()
                .scaleEffect(0.8)
                
                                    
            Image("logo", bundle: nil)
                .resizable()
                .scaledToFit()
                .scaleEffect(0.8)
                
            TextField("Ingrese su numero de cuenta", text: $cardNumber)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke( Color(red: 240/255, green: 240/255, blue: 240/255), lineWidth: 2))
                .keyboardType(.decimalPad)
                
            HStack {
                Menu {
                    ForEach(DocumentType.allCases, id: \.self) { documentType in
                        Button(documentType.rawValue) {
                            self.identificationType = documentType.rawValue
                        }
                    }
                } label: {
                    HStack() {
                        Text(self.identificationType)
                            .foregroundStyle(Color.black)
                            .padding(.all, 15)
                        
                        Image(systemName: "chevron.down")
                            .foregroundStyle(Color(red: 88/255, green: 195/255, blue: 107/255))
                            .padding(.trailing, 15)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke( Color(red: 240/255, green: 240/255, blue: 240/255), lineWidth: 2)
                    }
                    
                }
                .frame(alignment: .leading)

                
                TextField("****8519", text: $DNI)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke( Color(red: 240/255, green: 240/255, blue: 240/255), lineWidth: 2))
                    .keyboardType(.decimalPad)
            }
            
            
            HStack {
                TextField("Contraseña", text: $password)
                    .padding()
                    
                Button(action: {
                    eyeSlash.toggle()
                }, label: {
                    Image(systemName: eyeSlash ? "eye.slash.fill" : "eye.fill")
                        .padding()
                        .foregroundStyle(Color.gray)
                })
            }
            .background(RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 240/255, green: 240/255, blue: 240/255), lineWidth: 2))
            
            HStack {
                Rectangle()
                    .stroke(Color(red: 240/255, green: 240/255, blue: 240/255), lineWidth: 2)
                    .foregroundStyle(Color.white)
                    .frame(width: 15, height: 15, alignment: .leading)
                Text("Recordar datos")
                    .scaledToFill()
                    .padding(.horizontal, 5)
                Button {
                    print("Olvido su contraseña")
                } label: {
                    Text("Olvidé mi contraseña")
                        .foregroundStyle(Color(red: 108/255, green: 196/255, blue: 116/255))
                        .scaledToFill()
                        .padding(.leading, 20)
                        .bold()
                        
                }

            }
            .padding(.vertical, 10)
            .frame(alignment: .leading)
            
            
            Button {
                print("Iniciar sesion")
            } label: {
                Text("Ingresar")
                    .bold()
                    .padding(.vertical, 15)
                    .padding(.horizontal, 90)
                
            }
            .foregroundStyle(Color.white)
            .background(Color.green)
            
            
            HStack {
                Text("¿Eres Nuevo?")
                    .scaledToFill()
                Button {
                    print("Registro")
                } label: {
                    Text("Registrate aqui")
                        .foregroundStyle(Color(red: 108/255, green: 196/255, blue: 116/255))
                        .scaledToFill()
                        .padding(.leading, 20)
                        .bold()
                }
            }
            .padding(.top, 25)
            .padding(.bottom,30)
            
            HStack(spacing: 60) {
                Button {
                    print("Registro")
                } label: {
                    Image(systemName: "pin")
                        .foregroundStyle(Color(red: 108/255, green: 196/255, blue: 116/255))
                    Text("Ubicanos")
                        .foregroundStyle(Color(red: 108/255, green: 196/255, blue: 116/255))
                        .scaledToFill()
                        .bold()
                }
                
                Divider()
                    .frame(height: 40)
                Button {
                    print("Registro")
                } label: {
                    Image(systemName: "headphones")
                        .foregroundStyle(Color(red: 108/255, green: 196/255, blue: 116/255))
                    Text("Contacto")
                        .foregroundStyle(Color(red: 108/255, green: 196/255, blue: 116/255))
                        .scaledToFill()
                        .bold()
                }
                
            }
                
        }
        .padding()
    }
}


enum DocumentType: String, CaseIterable {
    case DNI
    case CE
    case OTHER
    case CREDIT
}

#Preview {
    ContentView()
}
