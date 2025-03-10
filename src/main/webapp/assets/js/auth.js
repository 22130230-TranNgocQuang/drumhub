document.addEventListener('DOMContentLoaded', function() {
    console.log('Auth.js loaded');
    
    window.logout = function() {
        console.log('Logout function called');
        
        if (typeof Swal === 'undefined') {
            console.error('Swal is not defined');
            return false;
        }
        
        Swal.fire({
            title: 'Xác nhận đăng xuất?',
            text: "Bạn có chắc chắn muốn đăng xuất?",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Đăng xuất',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            console.log('Swal result:', result);
            if (result.isConfirmed) {
                const form = document.getElementById('logoutFormUser');
                if (form) {
                    form.submit();
                } else {
                    console.error('Logout form not found');
                }
            }
        }).catch(error => {
            console.error('Swal error:', error);
        });
        
        return false;
    };
}); 