import SwiftUI
import PhotosUI

struct PhotoPickerView: View {

    @Binding var imageData: Data?

    @State private var selectedItem: PhotosPickerItem?

    var body: some View {

        PhotosPicker(
            selection: $selectedItem,
            matching: .images
        ) {

            Label("Choisir une photo",
                  systemImage: "photo")

        }
        .onChange(of: selectedItem) {

            Task {

                if let data = try? await selectedItem?.loadTransferable(type: Data.self) {

                    imageData = data

                }

            }

        }

    }

}
