//
//  PhotoPicker.swift
//  ImageGalleryApp
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @EnvironmentObject var dataModel: DataModel
    @Environment(\.dismiss) var dismiss
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> PHPickerViewController {
        
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.filter = .images
        configuration.preferredAssetRepresentationMode = .current
        let photoPickerViewController =  PHPickerViewController(configuration: configuration)
        photoPickerViewController.delegate = context.coordinator
        return photoPickerViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //update
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate,PHPickerViewControllerDelegate{
        let parent: PhotoPicker
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Dismisss the presented picker.
            self.parent.dismiss()
            
            guard
                let result = results.first,
                result.itemProvider.hasItemConformingToTypeIdentifier(UTType.image.identifier)
            else { return }
            
            // Load a file representation of the picked item.
            // This creates a temporary file which is then copied to the app’s document directory for persistent storage.
            result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { url, error in
                if let error = error {
                    print("Error loading file representation: \(error.localizedDescription)")
                } else if let url = url {
                    if let savedUrl = FileManager.default.copyItemToDocumentDirectory(from: url) {
                        // Add the new item to the data model.
                        Task { @MainActor [dataModel = self.parent.dataModel] in
                            withAnimation {
                                let item = Item(url: savedUrl)
                                dataModel.addItem(item)
                            }
                        }
                    }
                }
            }
        }
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
    }
}




struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}
