BlogImageTags
=============

Jekyll Liquid tags plugin that generates blog images with optional captions

### Usage

Add BlogImageTags to the \_plugins directory of Jekyll

Embed tags along with markdown etc like so:

> {% {image\_tag} {image\_name} [caption] %}

Supports three {image\_tag} variants: blog\_image\_left, blog\_image\_center, blog\_image\_right

Examples:

    {% blog_image_right my_image.png "This is my image" %}

    {% blog_image_right my_image.png %}

    {% blog_image_center another_image.png "An here's the caption" %}

### Output

    <div class="image-container image-center">
        <p class="image-graphic">
            <img src="/attachments/{blog_post_name}/images/{image_name}">
        </p>
        <p class="image-caption">
            Caption Text Here
        </p>
    </div>

Which can be styled with CSS as required (an example is included).   

image\_name is the same as the image\_name supplied in the tag   

blog\_post\_name is extracted from the url the blog post is being saved to. For example:

    /somewhere/something/abc_xyz_post.html

Results in a blog\_post\_name of abc\_xyz\_post. If the image was called "fred.jpg" then the URL link generated would be:

    /attachments/abc_xyz_post/images/fred.jpg

