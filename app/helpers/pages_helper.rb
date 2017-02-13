module PagesHelper
  def sponsors
    [
      { link: "https://www.google.org/",
        logo: "sponsors/googleorg.svg",
        class: "google"
      },
      { link: "http://www.autodesk.org/",
        logo: "sponsors/afoundation.png",
        class: "autodesk"
      },
      { link: "https://www.dlapiper.com",
        logo: "sponsors/dlapiper.svg",
        class: "dlapiper"
      },
      { link: "http://studiofathom.com/",
        logo: "sponsors/fathom.png",
        class: "fathom"
      },
      { link: "http://www.eastman.com/Pages/Home.aspx",
        logo: "sponsors/eastman.jpg",
        class: "eastman"
      },
      { link: "http://www.standardcyborg.com/",
        logo: "sponsors/standardcyborg.png",
        class: "standardcyborg"
      },
      { link: "http://colorfabb.com/",
        logo: "sponsors/colorfab.png",
        class: "colorfab"
      },
    ]
  end
end
