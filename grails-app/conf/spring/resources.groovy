//// Place your Spring DSL code here
//beans = {
//}

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

beans = {
    // تعريف BCryptPasswordEncoder كـ bean
    passwordEncoder(BCryptPasswordEncoder)
}