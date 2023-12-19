% This program solves for the roots of the quadratic equation
% f(x) = ax^2 + bx + c = 0, where a, b and c are real constants

a = input('Please enter a value for a: ');
b = input('Please enter a value for b: ');
c = input('Please enter a value for c: ');

discriminant = b^2 - 4*a*c;
if (discriminant > 0)
  if (a == 0)
    x = -b/c;
  else 
      x1 = (-b + sqrt(discriminant) )/(2*a); 
      x2 = (-b - sqrt(discriminant) )/(2*a);
  end
elseif (discriminant < 0)
  if (a == 0)
    x = -b/c;
  else 
      x1 = (-b + sqrt(-discriminant) )/(2*a); 
      x2 = (-b - sqrt(-discriminant) )/(2*a);
  end 
else
  if (a == 0)
      x = 'The solution is an element of a real number.';
  else 
      x = -b/(2*a);
  end
end
