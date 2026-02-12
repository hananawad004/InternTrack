
package interntrack

class Requestmap {

    String url
    String configAttribute

    static constraints = {
        url blank: false, unique: true
        configAttribute blank: false
    }

    static mapping = {
        cache true
    }

    String toString() {
        "${url} -> ${configAttribute}"
    }
}