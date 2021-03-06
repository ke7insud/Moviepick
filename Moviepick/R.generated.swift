//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 0 files.
  struct file {
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 8 images.
  struct image {
    /// Image `M-logo`.
    static let mLogo = Rswift.ImageResource(bundle: R.hostingBundle, name: "M-logo")
    /// Image `backArrow`.
    static let backArrow = Rswift.ImageResource(bundle: R.hostingBundle, name: "backArrow")
    /// Image `back_icon_white`.
    static let back_icon_white = Rswift.ImageResource(bundle: R.hostingBundle, name: "back_icon_white")
    /// Image `backdrop-coming-soon`.
    static let backdropComingSoon = Rswift.ImageResource(bundle: R.hostingBundle, name: "backdrop-coming-soon")
    /// Image `defaultPlaceHolder`.
    static let defaultPlaceHolder = Rswift.ImageResource(bundle: R.hostingBundle, name: "defaultPlaceHolder")
    /// Image `filmstrip`.
    static let filmstrip = Rswift.ImageResource(bundle: R.hostingBundle, name: "filmstrip")
    /// Image `incredibles`.
    static let incredibles = Rswift.ImageResource(bundle: R.hostingBundle, name: "incredibles")
    /// Image `movie-poster-coming-soon`.
    static let moviePosterComingSoon = Rswift.ImageResource(bundle: R.hostingBundle, name: "movie-poster-coming-soon")
    
    /// `UIImage(named: "M-logo", bundle: ..., traitCollection: ...)`
    static func mLogo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.mLogo, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "backArrow", bundle: ..., traitCollection: ...)`
    static func backArrow(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.backArrow, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "back_icon_white", bundle: ..., traitCollection: ...)`
    static func back_icon_white(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.back_icon_white, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "backdrop-coming-soon", bundle: ..., traitCollection: ...)`
    static func backdropComingSoon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.backdropComingSoon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "defaultPlaceHolder", bundle: ..., traitCollection: ...)`
    static func defaultPlaceHolder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.defaultPlaceHolder, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "filmstrip", bundle: ..., traitCollection: ...)`
    static func filmstrip(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.filmstrip, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "incredibles", bundle: ..., traitCollection: ...)`
    static func incredibles(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.incredibles, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "movie-poster-coming-soon", bundle: ..., traitCollection: ...)`
    static func moviePosterComingSoon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.moviePosterComingSoon, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 8 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `MovieCastCollectionCell`.
    static let movieCastCollectionCell: Rswift.ReuseIdentifier<MovieCastCollectionCell> = Rswift.ReuseIdentifier(identifier: "MovieCastCollectionCell")
    /// Reuse identifier `MovieCastNCrewHeaderCell`.
    static let movieCastNCrewHeaderCell: Rswift.ReuseIdentifier<MovieCastNCrewHeaderCell> = Rswift.ReuseIdentifier(identifier: "MovieCastNCrewHeaderCell")
    /// Reuse identifier `MovieCastTableCell`.
    static let movieCastTableCell: Rswift.ReuseIdentifier<MovieCastTableCell> = Rswift.ReuseIdentifier(identifier: "MovieCastTableCell")
    /// Reuse identifier `MovieDetailsTableCell`.
    static let movieDetailsTableCell: Rswift.ReuseIdentifier<MovieDetailsTableCell> = Rswift.ReuseIdentifier(identifier: "MovieDetailsTableCell")
    /// Reuse identifier `MovieFooterCell`.
    static let movieFooterCell: Rswift.ReuseIdentifier<MovieFooterCell> = Rswift.ReuseIdentifier(identifier: "MovieFooterCell")
    /// Reuse identifier `MovieHeaderTableViewCell`.
    static let movieHeaderTableViewCell: Rswift.ReuseIdentifier<MovieHeaderTableViewCell> = Rswift.ReuseIdentifier(identifier: "MovieHeaderTableViewCell")
    /// Reuse identifier `MovieSynopsisTableCell`.
    static let movieSynopsisTableCell: Rswift.ReuseIdentifier<MovieSynopsisTableCell> = Rswift.ReuseIdentifier(identifier: "MovieSynopsisTableCell")
    /// Reuse identifier `TrendingMoviesCollectionCell`.
    static let trendingMoviesCollectionCell: Rswift.ReuseIdentifier<TrendingMoviesCollectionCell> = Rswift.ReuseIdentifier(identifier: "TrendingMoviesCollectionCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "M-logo") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'M-logo' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let moviedetailsvc = StoryboardViewControllerResource<MovieDetailsVC>(identifier: "moviedetailsvc")
      let name = "Main"
      let trendingmoviesvc = StoryboardViewControllerResource<TrendingMoviesVC>(identifier: "trendingmoviesvc")
      
      func moviedetailsvc(_: Void = ()) -> MovieDetailsVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: moviedetailsvc)
      }
      
      func trendingmoviesvc(_: Void = ()) -> TrendingMoviesVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: trendingmoviesvc)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "back_icon_white") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'back_icon_white' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "filmstrip") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'filmstrip' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "backdrop-coming-soon") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'backdrop-coming-soon' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "incredibles") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'incredibles' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "movie-poster-coming-soon") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'movie-poster-coming-soon' is used in storyboard 'Main', but couldn't be loaded.") }
        if _R.storyboard.main().trendingmoviesvc() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'trendingmoviesvc' could not be loaded from storyboard 'Main' as 'TrendingMoviesVC'.") }
        if _R.storyboard.main().moviedetailsvc() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'moviedetailsvc' could not be loaded from storyboard 'Main' as 'MovieDetailsVC'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
