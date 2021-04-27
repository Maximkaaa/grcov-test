use derive_getters::Getters;

#[derive(Debug, Getters)]
pub struct One {
    one: u8,
}

pub fn another_fn() {
    eprintln!("I also work!");
}

pub fn test_fn() {
    let one = One { one: 1 };
    eprintln!("I work! {:?}", one);
}

pub fn one_more_fn() {
    eprintln!("I also also work!");
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
    #[test]
    fn test_fn_works() {
        test_fn();
    }
}
