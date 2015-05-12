#ifndef CUBIC_SPLINE_H
#define CUBIC_SPLINE_H


#include <cstdlib>
#include <cmath>
#include <limits>

class cubic_spline
{
private:
    // Структура, описывающая сплайн на каждом сегменте сетки
    struct spline_tuple
    {
        double a, b, c, d, x;
    };

    spline_tuple *splines; // Сплайн
    std::size_t n; // Количество узлов сетки

    void free_mem(); // Освобождение памяти

public:
    cubic_spline(); //конструктор
    ~cubic_spline(); //деструктор

    // Построение сплайна
    // x - узлы сетки, должны быть упорядочены по возрастанию, кратные узлы запрещены
    // y - значения функции в узлах сетки
    // n - количество узлов сетки
    void build_spline(const double *x, const double *y, std::size_t n);

    // Вычисление значения интерполированной функции в произвольной точке
    double f(double x) const;
};

#endif // CUBIC_SPLINE_H
