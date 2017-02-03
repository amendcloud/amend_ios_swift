Amend
==========

amend is a cloud-based service that provides an end-to-end image management solution including uploads, storage, manipulations, optimizations and delivery.

With amend you can easily upload images to the cloud, automatically perform smart image manipulations without installing any complex software. All your images are then seamlessly delivered through a fast CDN, optimized and using industry best practices. amend offers comprehensive APIs and administration capabilities and is easy to integrate with new and existing web and mobile applications.

amend offers comprehensive APIs and administration capabilities and is easy to integrate with any web application, existing or new.

amend provides URL and HTTP based APIs that can be easily integrated with any Mobile development framework. 

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

*Note: Replace `demo` in all the following examples with your amend's `amend name`.*  

Accessing an uploaded image with the `pc` public ID through a CDN:

    http://amend.cloud/demo/image/pc.jpg

![Sample](http://amend.cloud/demo/image/w_300/pc.jpg "Sample")

Generating a 150x100 version of the `pc` image and downloading it through a CDN:

    http://amend.cloud/demo/image/w_150,h_100,fit_fill/pc.jpg

![Sample 150x100](http://amend.cloud/demo/image/w_150,h_100,fit_fill/pc.jpg "Sample 150x100")

Converting to a 150x100 PNG with rounded corners of 25 pixels: 

    http://amend.cloud/demo/image/w_150,h_100,fit_fill/r_25/pc.jpg

![Sample 150x150 Rounded PNG](http://amend.cloud/demo/image/w_150,h_100,fit_fill/r_25/pc.jpg "Sample 150x150 Rounded PNG")

For plenty more transformation options, see our [image transformations documentation](http://amend.com/documentation/image_transformations).
 
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

The following example generates the url for accessing an uploaded `pc` image while transforming it to fill a 100x150 rectangle and set on ImageView ivResultImageView

	let amend = Amend()
    let amendOption = AmendOption()

    amendOption.transform(Width: 100, Height: 150, Fit: UIFitState.FIT_FILL)
    amend.getImage(ImageId: "pc", ImageView: self.ivResultImageView , Option : amendOption)


Another example, emedding a smaller version of an uploaded image while generating a 90x90 face detection based thumbnail: 

	let amend = Amend()
    let amendOption = AmendOption()

    amendOption.transformFitFace(Height: 90, Width: 90)
    amend.getImage(ImageId: "pc", ImageView: self.ivResultImageView , Option : amendOption)
	  
  
## Additional resources

Additional resources are available at:

* [Website](http://amendcloud.com)
* [Documentation](http://amendcloud.com/docs)

## Support

Contact us at [support@amendcloud.com](mailto:support@amendcloud.com)

Or via Twitter: [@amend](https://twitter.com/#!/amendcloud)