Amend
==========

Amend is a Platform–as-a-Service (PaaS) solution hosted on cloud. Amend helps you manage your application’s image resources in the cloud without having to worry about scale and performance. The resources are delivered by high-performance servers through Content Delivery Network (CDN).

Resources are uploaded, managed, and transformed using amend’s easy to use APIs and SDKs. Infrastructure used for these operations is infinitely scalable for handling high load and bursts of traffic.

Amend provides URL based APIs and SDKS that can be easily integrated with any Web or Mobile development framework. 

For projects based on iOS Framework, amend provides a library for simplifying the integration even further.

## Getting started guide
[Getting started guide for iOS]

## Setup ######################################################################

amend iOS framework is available at [https://github.com/amendcloud/amend_ios_swift.git](https://github.com/amendcloud/amend_ios_swift.git)

### Manual setup

1. Go to [https://github.com/amendcloud/amend_ios_swift.git](https://github.com/amendcloud/amend_ios_swift.git) and download iOS library.
2. Library is a ZIP archive that could be extracted using any unzip tool.
3. Drag and Drop the framework into your project.

## Try it right away

Sign up for a [free account](http://developer.amendcloud.com/Register) so you can try out image transformations and seamless image delivery through CDN.

*Note: Replace `test` in all the following examples with your amend's `amend name`.*  

Accessing an uploaded image with the `baby` image_name through a CDN:

    http://amend.cloud/test/image/baby

![Sample](http://amend.cloud/test/image/w_300/baby "baby")

Generating a 150x100 version of the `baby` image and downloading it through a CDN:

    http://amend.cloud/test/image/w_150,h_100,fit_fill/baby

![Sample 150x100](http://amend.cloud/test/image/w_150,h_100,fit_fill/baby "baby 150x100")

Converting to a 150x100 PNG with rounded corners of 25 pixels: 

    http://amend.cloud/test/image/w_150,h_100,fit_fill/r_25/baby

![Sample 150x150 Rounded PNG](http://amend.cloud/test/image/w_150,h_100,fit_fill/r_25/baby "baby 150x150 Rounded PNG")

For plenty more transformation options, see our [image transformations documentation](http://amendcloud.com/docs/image_transformation).
 
## Usage

### Configuration

Each request for building a URL of a remote cloud resource must have the `AmendName` parameter set. 
Each request to our secure APIs (e.g., image uploads) must have the `AmendKey` and `AmendSecret` parameters set. 


Set the `AmendName`, `AmendKey` and `AmendSecret` values under the Amend dictionary of the Info.plist.

### Upload

Assuming you have your amend configuration parameters defined (`AmendName`, `AmendKey` and `AmendSecret`), uploading to amend is very simple.
    
The following example uploads a file to the cloud: 
    
    let amendObj = Amend()
    amendObj.initWithDelegate(Delegate: self, Image: self.imageViewOutlet.image!, RequestCode: 1 )
    amendObj.executeWithImageName(ImageName: "Name_of_Image")

 you can get ImageId return by amend upload api in 'didReceiveData' method

 	func didReceiveData(ImageId : NSString,RequestCode : Int){
     
    }

    func didfailedWithError(errorMessage : NSString,RequestCode : Int){
  
    }


	
### Embedding and transforming images

Any image uploaded to amend can be transformed and embedded using powerful view helper methods:

The following example generates the url for accessing an uploaded `baby` image while transforming it to fill a 100x150 rectangle and set on ImageView ivResultImageView

	let amend = Amend()
    let amendOption = AmendOption()

    amendOption.transform(Width: 100, Height: 150, Fit: UIFitState.FIT_FILL)
    amend.getImage(ImageId: "baby", ImageView: self.ivResultImageView , Option : amendOption)


Another example, emedding a smaller version of an uploaded image while generating a 90x90 face detection based thumbnail: 

	let amend = Amend()
    let amendOption = AmendOption()

    amendOption.transformFitFace(Height: 90, Width: 90)
    amend.getImage(ImageId: "baby", ImageView: self.ivResultImageView , Option : amendOption)
	  
  
## Additional resources

Additional resources are available at:

* [Website](http://amendcloud.com)
* [Documentation](http://amendcloud.com/docs)

## Support

Contact us at [support@amendcloud.com](mailto:support@amendcloud.com)

Or via Twitter: [@amend](https://twitter.com/#!/amendcloud)