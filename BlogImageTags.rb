#
#
#   Usage
#
#   {% blog_image_left   image [caption] %}
#   {% blog_image_center image [caption] %}
#   {% blog_image_right  image [caption] %}
#

module BlogImageTags

    @html    = nil
    @args    = nil
    @image   = nil
    @caption = nil

    def image_tag_init(tag_name, markup, tokens)
        @html    = Liquid::Template.parse("<div class=\"image-container {{class}}\"><p class=\"image-graphic\"><img src=\"{{src}}\" /></p><p class=\"image-caption\">{{caption}}</p></div>")
        @args    = markup.scan(/(?:"(?:\\.|[^"])*"|[^" ])+/)
        @image   = @args[0] || ""
        @caption = @args[1] || ""
        @caption.sub!(/^\"/,'')
        @caption.sub!(/\"$/,'')
    end

    def image_html(justification, context)
        attachments = context["site"]["attachments_root"]
        root = context["page"]["url"].split('/').last.sub(/\..*?$/,'')
        image_url = "#{attachments}/#{root}/images/#{@image}"
        a = @html.render({ 'class' => justification, 'src' => image_url, 'caption' => @caption})
        return a
    end

end

module Jekyll

    class BlogImageLeft < Liquid::Tag

        include BlogImageTags

        def initialize(tag_name, markup, tokens)
            image_tag_init(tag_name, markup, tokens)
            super
        end

        def render(context)
            image_html("image-left", context)
        end

    end

    class BlogImageCenter < Liquid::Tag

        include BlogImageTags

        def initialize(tag_name, markup, tokens)
            image_tag_init(tag_name, markup, tokens)
            super
        end

        def render(context)
            image_html("image-center", context)
        end

    end

    class BlogImageRight < Liquid::Tag

        include BlogImageTags

        def initialize(tag_name, markup, tokens)
            image_tag_init(tag_name, markup, tokens)
            super
        end

        def render(context)
            
            image_html("image-right", context)
        end

    end

end

Liquid::Template.register_tag('blog_image_left',   Jekyll::BlogImageLeft)
Liquid::Template.register_tag('blog_image_center', Jekyll::BlogImageCenter)
Liquid::Template.register_tag('blog_image_right',  Jekyll::BlogImageRight)
