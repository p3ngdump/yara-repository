rule win_mail_o_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.mail_o."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mail_o"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { c744242007020000 8d504b 448d4056 8d48ce e8???????? 33c0 4883c438 }
            // n = 7, score = 100
            //   c744242007020000     | mov                 word ptr [ebx], 0x3225
            //   8d504b               | mov                 byte ptr [ebx], al
            //   448d4056             | shr                 edx, 0x18
            //   8d48ce               | mov                 byte ptr [ebx - 1], dl
            //   e8????????           |                     
            //   33c0                 | inc                 esp
            //   4883c438             | mov                 edi, edi

        $sequence_1 = { eb11 ba32000000 c744242803080000 448d4a6d 488d0578881200 41b8a6010000 488bcb }
            // n = 7, score = 100
            //   eb11                 | add                 ecx, esi
            //   ba32000000           | xor                 edi, eax
            //   c744242803080000     | ror                 ebp, 7
            //   448d4a6d             | inc                 cx
            //   488d0578881200       | paddd               mm1, mm1
            //   41b8a6010000         | add                 ecx, edx
            //   488bcb               | add                 ebx, dword ptr [esp + 0x24]

        $sequence_2 = { ba85000000 c744242011010000 4c8d0d30b30b00 448d42ea 8d4a8b e8???????? 33c0 }
            // n = 7, score = 100
            //   ba85000000           | dec                 eax
            //   c744242011010000     | mov                 ecx, edi
            //   4c8d0d30b30b00       | mov                 eax, 0x12
            //   448d42ea             | jmp                 0x554
            //   8d4a8b               | jne                 0x520
            //   e8????????           |                     
            //   33c0                 | dec                 esp

        $sequence_3 = { ffe1 488d15b1dc1800 e9???????? 488d15bddc1800 e9???????? 488d15c1dc1800 e9???????? }
            // n = 7, score = 100
            //   ffe1                 | dec                 esp
            //   488d15b1dc1800       | mov                 eax, ebp
            //   e9????????           |                     
            //   488d15bddc1800       | dec                 ecx
            //   e9????????           |                     
            //   488d15c1dc1800       | mov                 edx, esi
            //   e9????????           |                     

        $sequence_4 = { ffc0 4183fa1c 72cf 8bd3 8d4dff 81e2ffffff0f 83f90f }
            // n = 7, score = 100
            //   ffc0                 | dec                 eax
            //   4183fa1c             | add                 esp, 0x30
            //   72cf                 | mov                 byte ptr [edi], 0x20
            //   8bd3                 | dec                 eax
            //   8d4dff               | inc                 edi
            //   81e2ffffff0f         | inc                 ebx
            //   83f90f               | dec                 eax

        $sequence_5 = { f34d0f38f6c9 4983d100 4901cb 4911ec c4c2f3f6ef 488b5318 4911cd }
            // n = 7, score = 100
            //   f34d0f38f6c9         | lea                 esp, [esi + ebp]
            //   4983d100             | inc                 ecx
            //   4901cb               | mov                 ebx, dword ptr [edi + 4]
            //   4911ec               | les                 eax, ptr [ecx]
            //   c4c2f3f6ef           | jns                 0xfa5
            //   488b5318             | hlt                 
            //   4911cd               | and                 byte ptr [ecx - 0x7d], cl

        $sequence_6 = { eb04 488b45d8 8b0a 4d8bfe 8bc0 498bd5 4c8b6da8 }
            // n = 7, score = 100
            //   eb04                 | mov                 dword ptr [esp + 0x20], 0x29
            //   488b45d8             | dec                 esp
            //   8b0a                 | lea                 ecx, [0x10652b]
            //   4d8bfe               | mov                 ecx, 6
            //   8bc0                 | inc                 esp
            //   498bd5               | lea                 eax, [edx + 2]
            //   4c8b6da8             | dec                 eax

        $sequence_7 = { c4e37bf0e802 21d8 c57e7f8c2440010000 4401e6 31f8 410355e4 c4e248f2fb }
            // n = 7, score = 100
            //   c4e37bf0e802         | cmp                 ecx, 2
            //   21d8                 | je                  0xc7f
            //   c57e7f8c2440010000     | cmp    ecx, 0x17
            //   4401e6               | jne                 0xca0
            //   31f8                 | movzx               ecx, word ptr [esp + 0x62]
            //   410355e4             | inc                 esp
            //   c4e248f2fb           | movzx               eax, ax

        $sequence_8 = { ff5018 448bf8 85c0 752d 4883bc24a000000000 488bd3 488b8424b8000000 }
            // n = 7, score = 100
            //   ff5018               | dec                 ecx
            //   448bf8               | mov                 esi, edx
            //   85c0                 | dec                 esp
            //   752d                 | lea                 edi, [ecx + 0x70]
            //   4883bc24a000000000     | les    eax, ptr [ecx + 0x7a]
            //   488bd3               | outsd               dx, dword ptr [esi]
            //   488b8424b8000000     | and                 byte ptr [ecx + ecx*4 + 0x44], cl

        $sequence_9 = { e8???????? e9???????? 488bf3 488bce 418bff e8???????? c1e003 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   e9????????           |                     
            //   488bf3               | test                eax, eax
            //   488bce               | jne                 0x200f
            //   418bff               | inc                 esp
            //   e8????????           |                     
            //   c1e003               | lea                 eax, [eax + 0x1d]

    condition:
        7 of them and filesize < 5985280
}