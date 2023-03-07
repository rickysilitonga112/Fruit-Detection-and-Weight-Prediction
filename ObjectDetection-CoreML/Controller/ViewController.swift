//
//  ViewController.swift
//  SSDMobileNet-CoreML
//
//  Created by GwakDoyoung on 01/02/2019.
//  Copyright © 2019 tucan9389. All rights reserved.
//

import UIKit
import Vision
import CoreMedia

class ViewController: UIViewController {
    // MARK: - UI Properties
    @IBOutlet weak var videoPreview: UIView!
    @IBOutlet weak var boxesView: DrawingBoundingBoxView!
    @IBOutlet weak var labelsTableView: UITableView!
    
    @IBOutlet weak var pauseCameraButton: UIBarButtonItem!
    
    // let objectDectectionModel = FruitDetectionV3()
    let objectDectectionModel: FruitDetectionV3 = {
        do {
            let config = MLModelConfiguration()
            return try FruitDetectionV3(configuration: config)
        } catch {
            print(error)
            fatalError("Couldn't create SleepCalculator")
        }
    }()
    
    
    // MARK: - Vision Properties
    var request: VNCoreMLRequest?
    var visionModel: VNCoreMLModel?
    var isInferencing = false
    
    // MARK: - AV Property
    var videoCapture: VideoCapture!
    let semaphore = DispatchSemaphore(value: 1)
    var lastExecution = Date()
    
    // MARK: - TableView Data
    var predictions: [VNRecognizedObjectObservation] = []
    
    
    private var videoCaptureIsRun = true
    
    var selectedRow: Int?
    var weightManager = WeightManager()
    var nutritionManager = NutritionManager()
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup the model
        setUpModel()
        
        // setup camera
        setUpCamera()
        
        videoCaptureIsRun = false
        
        //appearance setup
        // pause camera init
        pauseCameraButton.title = "PAUSE CAMERA"
        pauseCameraButton.tintColor = .red
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.videoCapture.start()
        videoCaptureIsRun = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.videoCapture.stop()
    }
    
    // MARK: - Setup Core ML
    func setUpModel() {
        if let visionModel = try? VNCoreMLModel(for: objectDectectionModel.model) {
            self.visionModel = visionModel
            request = VNCoreMLRequest(model: visionModel, completionHandler: visionRequestDidComplete)
            request?.imageCropAndScaleOption = .scaleFill
        } else {
            fatalError("fail to create vision model")
        }
    }
    
    // MARK: - SetUp Video
    func setUpCamera() {
        videoCapture = VideoCapture()
        videoCapture.delegate = self
        videoCapture.fps = 30
        videoCapture.setUp(sessionPreset: .vga640x480) { success in
            
            if success {
                // add preview view on the layer
                if let previewLayer = self.videoCapture.previewLayer {
                    self.videoPreview.layer.addSublayer(previewLayer)
                    self.resizePreviewLayer()
                }
                
                // start video preview when setup is done
                self.videoCapture.start()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resizePreviewLayer()
    }
    
    func resizePreviewLayer() {
        videoCapture.previewLayer?.frame = videoPreview.bounds
    }
    
    
    @IBAction func pauseCameraPressed(_ sender: UIBarButtonItem) {
        // appareance change
        pauseCameraButton.title = videoCaptureIsRun ? "START CAMERA" : "STOP CAMERA"
        print(videoCaptureIsRun)
        pauseCameraButton.tintColor = videoCaptureIsRun ? .blue : .red
        
        if videoCaptureIsRun {
            self.videoCapture.stop()
            videoCaptureIsRun = false
        } else {
            self.videoCapture.start()
            videoCaptureIsRun = true
        }
    }
}

// MARK: - VideoCaptureDelegate
extension ViewController: VideoCaptureDelegate {
    func videoCapture(_ capture: VideoCapture, didCaptureVideoFrame pixelBuffer: CVPixelBuffer?, timestamp: CMTime) {
        // the captured image from camera is contained on pixelBuffer
        if !self.isInferencing, let pixelBuffer = pixelBuffer {
            self.isInferencing = true
            
            // predict!
            self.predictUsingVision(pixelBuffer: pixelBuffer)
        }
    }
}

extension ViewController {
    func predictUsingVision(pixelBuffer: CVPixelBuffer) {
        guard let request = request else { fatalError() }
        // vision framework configures the input size of image following our model's input configuration automatically
        self.semaphore.wait()
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)
        try? handler.perform([request])
    }
    
    // MARK: - Post-processing
    func visionRequestDidComplete(request: VNRequest, error: Error?) {
        //        self.👨‍🔧.🏷(with: "endInference")
        if let predictions = request.results as? [VNRecognizedObjectObservation] {
            //            print(predictions.first?.labels.first?.identifier ?? "nil")
            //            print(predictions.first?.labels.first?.confidence ?? -1)
            
            self.predictions = predictions
            DispatchQueue.main.async {
                self.boxesView.predictedObjects = predictions
                self.labelsTableView.reloadData()
                self.isInferencing = false
            }
        } else {
            self.isInferencing = false
        }
        self.semaphore.signal()
    }
}

// MARK: - TableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        
        print("DEBUG: SELECTED ROW: \(selectedRow ?? 9999999)")
        performSegue(withIdentifier: "gotoDetailView", sender: self)
    }
    
    // segue setting for navigation to detail view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let selectedRow = selectedRow {
            if segue.identifier == "gotoDetailView" {
                guard let vc = segue.destination as? DetailViewController else {
                    return
                }
                
                let fruit =  predictions[selectedRow].label
                let area = predictions[selectedRow].boundingBox.width * predictions[selectedRow].boundingBox.height
                
                if let fruit = fruit {
                    if let index = nutritionManager.getFruitIndex(fruit) {
                        vc.fruit = nutritionManager.fruitList[index]
                        vc.weightPrediction = WeightManager.predictWeight(fruit: fruit, area: area)
                    }
                    
                }
            }
        }
        
    }
}


// MARK: - TableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return predictions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") else {
            return UITableViewCell()
        }
        
//        let rectString = predictions[indexPath.row].boundingBox.toString(digit: 2)
        let confidence = predictions[indexPath.row].labels.first?.confidence ?? -1
//        let confidenceString = String(format: "%.2f", confidence/*Math.sigmoid(confidence)*/)
        
        cell.textLabel?.text = predictions[indexPath.row].label ?? "N/A"
        
//        print("Data prediksi: \(String(describing: predictions[indexPath.row].label))" )
//
//        print("Jumlah array predictions: \(predictions.count)")
//
//
//        print("isi : \(predictions[indexPath.row].boundingBox)")
//        //        cell.detailTextLabel?.text = "\(rectString), \(confidenceString)"
        
        let area = predictions[indexPath.row].boundingBox.width * predictions[indexPath.row].boundingBox.height
        //        let areaString = String(format: "%.2f", area)
//        let areaString = String(format: "%.5f", area)
        
        var weightPrediction: Double = 0
        
        if let fruitName = predictions[indexPath.row].label {
            weightPrediction = WeightManager.predictWeight(fruit: fruitName, area: Double(area))
        }
        
        cell.detailTextLabel?.text = "Weight: \(String(format: "%.2f", weightPrediction))g"
        
        return cell
    }
}
