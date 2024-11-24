//
//  ListStyles.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

struct ListStyles: View {

    var body: some View {
        HStack {
            VStack {
                List {
                    Text("Row 1")
                    Text("Row 2")
                    Text("Row 3")
                    Text("default")
                }
                
                List {
                    Text("Row 1")
                    Text("Row 2")
                    Text("Row 3")
                    Text(".bordered")
                }
                .listStyle(.bordered)
                
                List {
                    Text("Row 1")
                    Text("Row 2")
                    Text("Row 3")
                    Text(".inset")
                }
                .listStyle(.inset)
            }
            
            VStack {
                List {
                    Text("Row 1")
                    Text("Row 2")
                    Text("Row 3")
                    Text(".plain")
                }
                .listStyle(.plain)
                
                List {
                    Text("Row 1")
                    Text("Row 2")
                    Text("Row 3")
                    Text(".sidebar")
                }
                .listStyle(.sidebar)
            }
            
            VStack {
                List {
                    Text("Row 1")
                        .listRowSeparator(.hidden)
                    Text("Row 2")
                        .listRowSeparator(.hidden)
                    Text("Row 3")
                        .listRowSeparator(.hidden)
                    Text(".listRowSeparator(.hidden)")
                }
            }
        }
    }

}
