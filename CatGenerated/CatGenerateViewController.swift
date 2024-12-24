//
//  ViewController.swift
//  CatGenerated
//
//  Created by Mac on 24.12.2024.
//

import UIKit

final class CatGenerateViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var catImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView))

        view.addGestureRecognizer(gestureRecognizer)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification , object:nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification , object:nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
       let keyboardHeight = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height

      
    }

    @objc func keyboardWillHide(notification: NSNotification) {
       let keyboardHeight = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height

        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    @objc
    private func didTapView() {
        view.endEditing(true)
    }

    @IBAction func didTapCatGenerateButton(_ sender: Any) {
       downloadCat()
    }


    private func downloadCat() {
        guard let url = URL(string: "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAMAAzAMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAAFBgMEBwIBAAj/xAA7EAACAQMDAQYDBwMDBAMBAAABAgMABBEFEiExBhMiQVFhMnGBFCNCkaGxwdHh8BVScgczYvEWJKJT/8QAGAEAAwEBAAAAAAAAAAAAAAAAAQIDAAT/xAAiEQACAgICAgMBAQAAAAAAAAAAAQIRAyESMQRBEyJRcWH/2gAMAwEAAhEDEQA/AM3jmq6j+EUHiPI+dEgfAKpFE2eyTYeukuKo3LYcV7b5eVV8icE0aMgvBLkgetXbe2nlk8EZx70T07S7GCBJeXkPnVy4u3t4x3aIRny60rlQaA/+k3cjHCkV9Hot0zePCj3onBqt5MzCGJuBnGKJwac6/fSs+SvwN8zmhzDQMXQlWyR0lAlycj5eVVY7VECPdZWJ2wGI4OPemaC07yOWNTtHdEqDyUx5fXJqp2sVF0sRbVKRhWhHlnHP+e9bkYgttBgvII/s53Kx4Iqe+0ePStLluApkkQnI+VDNBu9RtrmO25SHapYsfUjp+fFMOoXiX9kkVyjJGyYdgcEE9QaFmFLTNUMyswxndgL50S02+m1G5a3hBWRTjFAdY0qSO5tRZuIkWNQW5HOOpPuelHOzCfcF2VReRSBZDnl+uf4/OtZhl+zT2+SyMwX4iaHza/bLlCwBB6VJq2pXQtg0EwAlGNrdQcZx88UoWtjd3d33uwHPjwTywDDNHRhsW5kkL93Gcjjd6VesLpshZJRx1riBQRCMADgtjqQKu3VolzNPJJsjjBwmBjPNIzUXba4jYlg44O0VLLcIy+E5oJNplwkbPaSE4+CM+dCIpNUWRo7pTG2fhHShSCPMTKzDbzxV2EdKUbK7eArl8sB09KPWOoxPjLc+datChtBXkg4rmGVXAKtkVLJzTRQrKuPFVwDwj5VVxzVsDwj5VePRKXZ+UIuo+dE0PgGelDo1z9OTRaCNSoZ2CgDjd51LlRerPYtPWYd5KcegHnRrTbaCJf8AtA49RVCK/jjiIQge56VzA891KDbkuv4gmP2pXJsNDOsgMeU8vICi1npySgCf42H4ui/Ooez2lG2tvtM8LNOTmNRk4Hr6USt8xNNM2UL5LBhkZ+VAJ0lvDaRju9iouSwA9utRSSNLFDKjEMseHU+nXP8AnvVVpnW4jj+IdQVOcf8Avmuo2eMM6rJ438PGcD/Ca1AJ1mKfeMCAz8tjyx6+uR+9U9cKTW0ZXO9jtUnpyDjH1H6V7dTSKgikZY1VsjcPTg/nuX8jVa7thcQNFMzEyxkIqnGM4HB9uawRU13tLKt9Lb26GR1G3jgcYH+GnnS2N3potQFdiDufqd5/fnFZ72o0d7IxXtqjmNAdxPl7n9KJ9ge0Ak1i1hdWK85xz4j0/esYP69YhbKdC7BQm9W8zgcD6cVJ2WlS4uTCyEYXxEDy2jaR+ZB+VWO2jpJaRh3JMGV8I6naMA+1U+yUf30c9swylsu6MnOWIOcn8qxi32g0zv7IojYlbABH4W9D8/WlnQ9Qkt2j70Kjxck5xkk7evl6Uy9s9VMItzA6iZH2smMAkgfyaULG0u9Vv3EiKi7thz67gfrR9GH/AEx0eWPx4yuD7ceR86ud5I8qqpBhTqpbIx6+9AbKBbaFWEmFjhLFmPG7y5HlV5VZXKSNzF8J6bgDxn50ABW2vBI3fOMQp4f89+KugwTOwlCmYjIRR0WgzwxxM6xkx4bhW6K3nn611G4jkZ95Z8bSf8+tExY1DRi2ZbP4sZKE0tT3MsIMUiuhBxkHFO1pcwBWzkvwMVzrmk21/Bu4Xbydo61gi1oOvvbSFZJNy56E01W3aOzuTsV8NnoTWTau66demI795PA9BUmk6urXapI20A9aKFo2mFwxBz1q8OgoBoNwk9qjI273o+OAPlVo9EX2fmTSdIuZbmPdC5jJ8R9qm7T3wjLWhQRmPAAx5e1MejSCdwEBfA4waWu2ul3CJHdXW1ZskFRzwelRki8WLy3TMFXfgjyNO3YGyuZ9UjlbwQou9vMMPIfX+KUtGthMQiqxLHGwQq+fzHFa3o8UGk6WkQiQTuBvwiqflxQCFLq8KSFFOGxgj0HtQ6QvPjDFCoIPPwn1qlAUurmbbISXHAzg8Zq4qmUZwAEBzgYyPT/PSiA7so5FnSNDu3gZx+Eef6k19KdswijJ2wkb2U+eM5/j6V6WnSN3iO9kOceTKf8A3XFvbwz3DXEDld2C0eOfcEfStRj24VLmV5piTE+5jGfLBHT8zQ2/uobS3Xa7My8KoPr/AH/amC5gitiJIMFJF5B8z1+mazLtNfyC4kVPCcgcfOs0EetNsodZ09Wuo8xR+MZ/FtxwaSO0WkTdmNZS+tIfupMuwX4VP9OM1o3YOAyaFEZG8Mi4Kn3rrt9Zpc6BcxkEySKwQedKYo6tfLddlra9iiDqVG4Yz/yNQ9lbaEmSe2l8ZGxyPMjkH/8ARFD+x7n/AOFXH21mkwJE4HQg4OPyq52J2QRXq7d0gVSRn4WAx/T9axgHrnd6x23WzL7UB38c8jH9KfotMht43khUKd+5VC8kcDP7flSf2Njiue0V1cSpmaOVlDH8PnWnbMsxIBTbgn50TGeXF/FDfqkiKIjwyDoVweBR23ZZoYrp3D55xkHpwP0ApF7bI9jrohQts+JC37Ue7JSNeJErgAIQP71qAMUUKS3qQTAnPJI/XJ+ddIrOspBRQm5V2jO0Y5okU2JM8TBGbCqWOAFAxn9OlDJFNvIv2dMRkg92eS5PU+/l+VGjHDxmJIRvJ8OWI64H9zirthfv34hOcY5Nct3ksY37VZmAVfP/AD+tVmgcXEjFisUS5CL1z71jCj287PiIz6jC7yK5yMNzms9sHmNykaZ3OwGPOttkZL22a3ULudfAGGRmk3/4tJa6vHeC2DbXywjP8UTGn9lbU2uk26P8W0ZpiAJAobppVraNgCOBw3UUTBGBVorRzvs/M/YTXDDqqQSHiTwqT60d7R6XNdzkCR2z0LHpWdaQXXUrZozhlcEGtRa/N3ChUfeDAJC1zt2dNUU+zvZ8aVJ37MNxGA5ySPlRwLHdxmFy8YV8o34yevNQWguZ5wmVWAjjd0Y/PyorEki92jhWUeYKnHzPWigFOFe7cTKNrKMHAwM+oq8breRKGARl5cDjPuKnAImxJIu1lwoA5J/LkV89uxXxqQreFgcEAfIgH86xgF/qjkSgR7CjYA8gPaiWj35lxH3gZwc72XkfXz61zc2iLDIsS5A88jJPvk18iGTY6qYiFwyKvH5f3rIwXvow+nPggMuWXisd1lzPqLqPiL4x75rXBKO6aN/THWsy13TZrTW0m2FkaTcpHnzTUDka52YRo9Jt0dQrBBx0wa67RKPsJEjjcyMeOuaraRdD7JFv+MrnOfPrUesXYe1YEb5NvwjypaNaE3stO1toF1ZDJ7t3Xa3XnnNc9m7iW0tTNIeGk2OR1289fkTXwC7pJjkiaZpNi+S8AD9Kq6PcGO9uEljJ71yML8IzmtQbDnZGzSz1q6ZHJjkJY5Ofl+9aOBm3Cjr1+orP9M/+qigPk52Kcc4HIpstdQLJljxjg1qBYh/9QrJ5LtJ1y2OQPKif/TuJZYmkZeF4x5V52zM15AUtFJPr6CifZyD/AEzTI4iQWPxEetFI1h6/migQsYDIyjKqueTj0pSgv9Qlv3lngkgXnBLZz/ntR+eeEZkuZY1UjhGOcmqck1lfSLGO6Yxjw4l2/wAGi0ZMsWl4ZNmxdoXz4DY+o4+dWFiVxLmIrnjJ5U1DaWRWbwuViI8/Fn2GKt9zPGH7oZX0ztz+9AJTvCYYkW3UkpyxIxx6VZsJFmwUw2Ou4c5qZw0kAhdeD8RBz+tDXintbndhk/2kdCKJhpt2zECBj2q6M4HPlQbTrtpQEZRu9aOooKLnPSn5aJOOz8qdlNDuNVu90QxGnVs4rTYbIW4SBAASAOua+0W1j0jT4rcRqrFfiA5q9p6P35cL3kQPx5AwfnXP2WLdtYLbRYY5B5KYz9K9EEERzAFCHqueR+9TtepHG7SHuyME4O4/XFDZr+BU+7uVkbqc9BmikYnikijmxGrSufOPnb9TUF7q9vZQu0jKkY5ZpDlj7CqUuoLbwuCXkOM7UHBPqTWea7f3Wr35R1wGbwKR0FPr2ANap26kLNHpiYQeZXrQ9O2OtrghUIz/ALcV7BowgjyVWZ8cZcIDxk8mh88cuY2W9tcyEfdxOSYv+WV4/WlhLn0Zquxhs+38hbZqdrhD1dedtNdo9rq8SSwlJV6gjmkBLZPtS2N9Jazu6ho57aTcpz68DmpNJvZOy2ro2WazlbbIhPw+hpo50pcWgPG2rRqJs2t4RGg8QXg0Ove8BZiD5A016eYdQsknhIcMuQaD67AVwFXwbv1qvJE6Ytyw5ZjwkIXbn5edD9Kt/wD7UgcFijeEEckUajQ87wBgkkHoaiswwnmZiSVAGR8qRjInZkgTIBY7uQfLNFbGORwApziqEyb+6VAT+LmmfQ7TEAkY8k1lSAyhcWqRwlpBgAfnSJrXa2UTva6GveBTtMv4c+1Mn/UrUXt4I9NtSRLckgkfhXzNI11ZSW1lDFaRKDKcHxqvhHXkniklmSaih1j1yYGu5bi4l33upO0nu5wPbipI7PUbVDLZzygHklGyDV1LaM6gx/06FoxEC1tHdhRzxnJPX2qXR7k2GppEVMcEr7NjHcADnHPnQyckrDGmyfQO2d7YXCwagGaMEZboye/vWqaVqQvIA8WJd3Rg2P4rNO1+iQrbi5j8BiYbvlRfsfZ3AsCUk3gHABOBihDIpxtDThxZocUrMxQht6+RHB+vIq5cWvfweIkHHHTrQKzj7hjuU7SMsrE/p6VXuO0cVhddxJhN/Cqz8YpxQjbmS0l2S7VYny9KZrWUGEeKku7uO/SO4jBKjzDA0YtL0LAvFYBnmqX8eAEBUngVdtZRbaWGEhE3UndzSnqt6r3YWGTduIBGOgopq96INFEcEqM4XGT/AAM1qNYGvLm71W9EMTfixxMFOPY0ctuycZA76a5ViM570MpoV2G0vvp5ru5SVcPlW2oVb8+a0AuhiIQcf8sEfSsa9gqw0lIIhF4mwD4i2aSI4tuukSLnG4AHyOa0eDb3yhicfn+tJnaq1bTdXF8gZoHO7pxz1qU03F0Ug0pKyh2odY5reK4QtEys2MkgNnrgHrQKa/jEyGO1twinO0wpz6g8c/Lypw1qxGr6ZFJCV7xeYiD+9I1xDLDKY5Y2Vx5EUviZFKFN7Rs8HGX+FpZ0nuUMMEcbGRdmwY/Py/SjvbC0UWLNgZHXAqt2W0WWW5jvLgMkacxoern+AMftU3by8jSBLWNt0jHxcf57/pXNnyc/IjGJfFGsbkx0/wCkus/a9MFo75aEbTz1HlTprNsrRAgDOPSse/6UP3Gsu0h2xLHucZ6nyrXrzUYJoj7dSOa7W9nLxFqWAh4ywOMnOBmhdujR38m1dxBGAeAfnR93V2L7fEOi561Rhj767k4xgDBouRqLtnb96QXwCeoxTRbRraWW7HhQc5oJFJsCqSMr5nzq8NWiSMxykHI6Z9qDkZIy7tJqQ1DtcVY+GFdq+/rUPahJ4rW3mjYhFO1uOmeRQbtE8kOv3E0I8UcxI88imrSb+01ayeGYglhgxnzrizuWPJHJWjqxpTg4exCjlmjcuHKtkndnnnrV3Sklu9UtYFyQZBnA+EDmjN52NuFmxaTgofwSA7l/LrR7s9oMGixvc3LDc3xytjp6KPT681bL5mL4/q7ZKHj5OW0e9r4kbTpceIy4RPrTH2I094NKZpHB8eNxGc7Rilxe97SawkVrnuIG+7GBwem8/LyHmce9aMkMenWMNnGhMcajge3mTS+LFxh9vY2eSctHIhWUEbGlB5BxSv200yBLb7S0QJX0cjH70ztcLGQVUsG8hxj6UM1iaOeF4ZIfiB4YYrtic7Yu6XfmfRwAuADgc5ojDfukSjGeKX7GVYRJbI4OCfCFxir9tFM8ednQ46UQCOEjhZ5ZGG49Mmgeoamly5hfvHAOFCnH68/tUWq3bO+yPdiobKCaGWJ2iwuc7mOKF/gTSNB7600ePeixkL8O7n65xzRWDU7eaFS7Zf5j9aVoLqZ7Vmlk3IMEgedX7Xu7iGPbJHEnkSuM/WiBh/7QhjVkdQB+Fyf3qe8FtqFv9lvsAeXsaWbi1KSrm7dYwc53cGuI7yOWRoo+8c4/3cfOlaDZPJomr6O7NpbxXVqx/wC23H5ZrkSykg3WhXwfPVFVwflzVnvbyCJQfu4zyN5ywHtXw1W8hfMdxmPg5C1y5PGhJl4ZmlRGBrV391pmkzRnp3lwwUfkM1xfdjIrKwlvNXuO/vXB6HAXPTAotbdor9IWdXUk9Nw8QHyqnfahLfwsbiTk+ZXitjwRx7SNLK5diHaS3NlrsMVsGOQU/wCXrWnWN0I4dhYn1z50m2kKLdzTvGT3QOCpzkn0o1p4uHTfcOFbGQv+2rMmMMcokn2+vmKJxWqL4lAz60F0wozFyc+9EXugOFbgdealtjaJLhyrjkDHT3qlfNHPAyMxDnpgYri8nBXfvyR0xVOSNruJWjdo5Ryh8j86eIGK+mWmzV5Uvo+9KS5GTzzT3J2L0nVlFxYMbWcgeKHjB9x0oDc24jEV3tIlztl/9UbtbqdLaN1UwyDoQSQ1aUeRotx6OW7H63ZLhe0CCPpukhBIHT1quvZizMqza1rs99sOGSMrGufl/evr7UZnJW4I3DJyuTzUdtdxXEG2WQh/xYGMfKljhgna7GeWb02Mlpe6Tp1t3enQrAmeu0lifmOteS6kih5JHj9SSfL86F9xYzQBpXlfI6h+R/Sqp0fvb3dbXOFKgYc4Cfl1qyRJsMR6hC7COMOefDuyF/fNC7y5kF+005QKoxtBJ/ehluG0ueTvx3spYiMLnBqLVXuhCs0qKWkbOCeVqqVE2D7ucLq/fomIW/GK0zQUhfTY38Jzz0pLi09GtVEnxsc49KftB0xo9NjUcfI0J6DEwqysO8Mb91wR5ijCWSzE97CoYDAB/pQvTdVuJrYSM+3Izx50w2Vy3d5fbvccM1ZUZpnGnwRRo6iEufMr0HFQ31j3cTPA5jzydhGD86lVjaSSnvBhyMAnzoNe9oFRyrRd6ucEuTx8qbQuw1YSi6t9tyI5PwnOMmidvbWtvG7W5RTjxArkH2zSbbRnUEeS2buhn4AOteyrqdmgUzPIvUruNZoKYcvZZWdgwymeMg4+lfQp4QGAJYbto5/Sg8X26/c4QIqcqrsc0a06wKhisoVs9XzxS8Ri7Dbcx98zKeoC8Y+dS3FqocoMM3ka7cDgGSIuQAxNSoRsLErlehHFIxkeWdiIogwRWkxkADzqvqV1Dp42zYSSU+Y60b06JC6uX5PXmptf7NQa3aBJBtcDwOvUGpSnQ6RmZ7SvbTskb856VJDrtzIWkGcHyNBu0fY7V9HllmkVpIl57welc214qRWykjcR4h6VSKTWgf0Mt2ikR+7c4DcU36Lqts8MEBYNK3T2rOdK0PUdd1ORLQHYGxnyrXuyfYqHR4w9199Pj4j5UJNICRDeAOCNnXjJruKRkVokXdkfEDjb7UV1K2iXgLgily6vbUhmhn8QODtPH1oJ2Zlqe3WXxd3jcdpJ65oLevdWl4sSAY/CV6/IirEN/CHKyzEhvhwQefnV2VO/iO1gPD4XJAq0YWI5UBrPtD9kdoNSUrzkAplT9fKi0naSxgte873af9sYHJ9CPKg7Lb3qyW1/3qHcQp8mHrQyfs5snH2OXch6bjyKooUScg6dRikj+3yERhvhjPT54qYhL6MYCvyGpF1TS72Bs/aHkU/FzzRvQtRKIFkkZSBgZrPQ0d7HyKO3dYlaPBBp5sUCWyBemKz7sxFLd3AdzuUGtGtk2wgAHiozaHiflXRbh2tSgQEx9KuwyPGe+llJweBngUu6RcmC6UHG1jgg01taRzoGTr1G3kUY7CyhdazNJkRxFxngn1qG30u5vpFaVtuTkkc/pRqwtIY2IcZY+ooglu0ABhGDngCqKFiOX4RWNrBp8YwHDD8ZAyK5uRHdtvM0hYdOcVMzyCMBkG7yz5fOvbe0LSbxG2T5twKukiLv2e22+32hFyTx8Ryf61fkvfs8ZJO92G0Rr5GuktckMzgY4wg/miGm2sNrL37qxOcAFc4+tJkjWxoS/QfDpOsXlk0u5IHPIDDOBViTTilhHDqNyO8XlnTjNTX+q3sl4sFnAxQjl88VUt9O1OW4n+1zKYpBjB8vlXO0XQattS0+2SBc5ToMckmmjTLhLiJWQHHkG4pT0zTbLTrREldGVDks3WmEalHDbI9su4dBtFSaTDYS1G0h1C1khuYxhhjrWD6z2ZksddktYZMwtJ4D6A+VbBd3sz/FIFUjkedZ9rU8L39u+cEP5nk1eMReQ99kNFtND05EhYtIwyzHrmjk18yqdo3YFLOnXqPFHtZtyj6GrjXU6q7mJSF9DnNJKH6FSK93rRSdkmhIAXJJ6YoPaT6BJ3kvd7Y5DhsgYNEpry1uLdpL2IwqOMkdaGy6Hpl3EDFKqKTldpxzQiqM5FqPs7otwjJC2xG8SYYZX5VG+l/6eyxG5lYLypGeR+1ejRWEsE9rPllwCgbOaJTif7NidCJh0IXcMfKrQWxJC9OjxsZA7s34BtHAqjFd6hv3NgRk85Xk0f5BHew7jj44cnj/AI9f3rh4wVyU8BOQcV0tHNZR7lLsbn3Bj1Ax/SprPRklmWNUbPqQBUsYBlWOMcmnbQtM7qEPKMvUs0lFFcdsm0DRo7OAbmYt7NimKJV2YG7j1Y1WXCpx5VNG/hrje9nStH4yzznzp10KZZETLDbgZANJ8MEkv/bQtjqR0Hzo7o0lpYkLdXSs/kkQzj61SDA1Y0yW4I+4+P5ZNcI10PDCrSP0IAJNSwapF1SCML/uk8Rq6JDcpjcxBOVXoPngcVZEZEcETR7ROY0nPQMckfQZopbwwqR4mnf5YGaoQ6W0biWZ9o64A5/KiFvqEcLCK1XcxOOOTVFJk6LrRGNcyEJ6Ig8VdQyxiBjJCVjLY285Y/zXcKjfiTxynnaDwPnX0+0PujAZwPE+OAPQelFrktgWmDb/AF9oHMNtbngY+HH0FR2/+o3z75Puk8wT+lWnKQqJWgUkcp6e5qje6rckwJCEQ3Bwit1I9aT40OphC3sYIO+aZwI2+EE5xVy3u0hXu4QGUHg0sG9jeV45ZwUU7Tz155/mg+o9pIooCsGdwPl86KxxXYHKUtIPdpu0MdpE7K33pOMA9Kzq61Ka5mWRmJA6VUvbia7uZJGLMHOar55xzmpynvRaOOux37PdqDbmNJyfEdufSn2HUN9sDCRJ59eorEYfjHtTR2f1lrRe7mYkE5X2p4SUtMXJBpWjSp7u2nhENwmM9PY+lQtplpdjZ3roR8OxqDpq1tLIY3IAlTAY+RPpXdqFuJgsEjbxnG087h+H644pvjiianItwaTrFvdHEgmQ/BIvRh/B9qPRvNLAEcFtvVhwyn3qHSWkRFjaZn3crnILf3otLEJwZLfAm81Xjf8A39qKVAewRPGjN3rDft6yR/F9R5j5VRkedD3kUuUY4DxnIPsfT5Gu72479tijublT8JO0MfY+R9q90xHmmwymKUeFmC43ezCi2BIO6FZCfbLPFGXH40GKb4lVUAAobpdssEY2qFz1weKJg8c1x5G2zpikkeNXUZ8P1qItXyuAOopaGs/IM13PKoR5GKDog4UfQcVCpIIIPSvBRCwtIivf3rGO3B4H4n9hWQRg7PNNqP3cUfgX/uO3AWmq3u7Wx8ETCWUcFz0HsKUn1GU2Sw2K9xD17teuPf3qW0nMFuAygknk+dViyUkNrXS3IOXz9a5jWZCTbfcw/jmbhm9h/ahtlPHFD391kRk+BF+Jz6D+tEkma5VXkAUfgiHRautkXomt9RyywxKypnzPLH1NGbP79SGI7tfiYeZ9KCiABwgP3zeY/CKsG7S3VbZQcZ6etMKFWgS7Y70AiUc5Hl7UsaqhiuZb+QKHxsgUD4QPP+Pmc0zi4j7lIed8niPy8hVXWrON7fu15K8k8f51pZLQ8WZVcd9BNGXJ8RLZHTI4/mqmnWl7qPf/AGWIymJe8cZ6CjWuRGMtHjOIz+tC+z2sHRtRW5Rd0bJtkT1rnvZ0LStFWDvWlyvAHUAcVIbR5pCwTr6DFEdQ1dbu5d7KzADN5nB+ZFRLc3asNotFPpuyP3pa2dMZxr7ESWDIuQrknyUZNWtT0i60yyt7m7YIbgHEfmgHrXen6rfQyl+5gkZfXIzUGuaxPrFxELhNgXwhB+EU8dIhllb+vRNArObZpXYMqjAzyDnIp+0iI98JdjKJAGOB69cfWkvQLdr28BHTPHy8q0yyCW9shk/Dx6VTEm+yOTQU3I0AkGST6eTf3oZPqUjEvbsA68SL6+/+dDVWTU+7nMPLQtwVz1H+fqKivLZo7iK8tuY5OuemfMY9/wCtXZFbDG221pUa5ULcjhJ+mf8Axf8ArRbTbNo2CTp94nAY+n80EsI+7bIPgcfn7H5U0WMwKrHIdyj4H9Ki3ZRIKwjYoqfPFQRgqOeR5GumOFqfHY9nEjYBrkPxULuQfauQ6n1+lNwBZ+VTB9nxJcrjPwp61E8zTyBpG4HQdABVzV1dpu9Pwny9KG1Dosg7pEySFgSAfLJ60aS1BBnuPDDHyQOrH0FKmmh3vIkQdTz7CmoXkV8Ft7dsRQ+Ef+R8zRixWVGvpJJWlmwDnCjyQegohaanty7knZQ+/tmC7OMeZ9KoxMZJVVDiJOvvVFKhHGx80q7BUyscs4zk+VWYY1nlaaQ4ROfkP8xShbXp2lwcLg4ond6m1tp8UK8PN4j6hB0H81aMkSlEIDUJG1IEeIs/Iz5f4KLJqSTyMJMKvmxb9hSppVyrTZJBYKzE1TvtRWO52ggjd5Gqc4sTi/Qd7UaTJfRrPp8RcgYIHmKUouyt9g94ixjdjLHz+lOeka9CkHdzMSo9P4o7aGGZFeQBxncw61GeL2iscvpiNb9kmt1EcrI8m0GRQfhPpVn/AEMrIqhAdvoMcf8AvNNq28L3LzqTuc4PPQf5+1eLHut1MAYsg8WP9p6/t+lTXJFbTF3/AEG3LqJuVK4yPLIqnc9lJu7c25WbHRW4YU03ULNbr3bgliAD04AGB+9XYCpWMyt4wOredGMW3sRySAPZPRZtOD3N0O648KnrRW7vjKjRxKCCOtdXd8royR5HOCKoQcN1zXTFKKItuR9DbmUBiRnPSjWm42vZykd3J8Jz8LeVD4iFA9a97/7zIOMVOch4oJ2zGIvHLnBODkfCegNFdNusP3T8EHjmhN8dyrcL0f4vnj/P1r3S5jK4/wD6J+oqa7KDtBcYTaRxUjyYU85X1NUrcl0z7VNlsEFeKf2IyvNIQ1RCUNyWx9K9lQjKt0/3VXIYHGP71VJCtn//2Q==") else {
            return
        }


        print(Thread.current)
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            print(Thread.current)
            guard let data = data else {
                return
            }

            DispatchQueue.main.async { [weak self] in
                print(Thread.current)
                self?.imgData = data
                self?.performSegue(withIdentifier: "showCatImageSegue", sender: self)
            }
        }

        task.resume()
    }

    private var imgData: Data?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if segue.identifier == "showCatImageSegue" {
            guard
                let viewController: SeconddViewController = segue.destination as? SeconddViewController,
                let imgData = imgData
            else {
                return
            }

            viewController.setInput(with: SeconddVCInput(imageData: imgData))
        }
    }
}
