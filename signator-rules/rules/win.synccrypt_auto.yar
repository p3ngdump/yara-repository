rule win_synccrypt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.synccrypt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.synccrypt"
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
        $sequence_0 = { e8???????? 8906 8b442420 8b18 8b4318 85c0 741e }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8906                 | mov                 dword ptr [esi], eax
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   8b18                 | mov                 ebx, dword ptr [eax]
            //   8b4318               | mov                 eax, dword ptr [ebx + 0x18]
            //   85c0                 | test                eax, eax
            //   741e                 | je                  0x20

        $sequence_1 = { c704240f000000 ffd7 83ec08 83f8ff 89442454 0f84dd010000 8b442424 }
            // n = 7, score = 100
            //   c704240f000000       | mov                 dword ptr [esp], 0xf
            //   ffd7                 | call                edi
            //   83ec08               | sub                 esp, 8
            //   83f8ff               | cmp                 eax, -1
            //   89442454             | mov                 dword ptr [esp + 0x54], eax
            //   0f84dd010000         | je                  0x1e3
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]

        $sequence_2 = { ddd9 0f874f0d0000 8b44247c 83c001 39f0 8944247c 0f8dd1010000 }
            // n = 7, score = 100
            //   ddd9                 | fstp                st(1)
            //   0f874f0d0000         | ja                  0xd55
            //   8b44247c             | mov                 eax, dword ptr [esp + 0x7c]
            //   83c001               | add                 eax, 1
            //   39f0                 | cmp                 eax, esi
            //   8944247c             | mov                 dword ptr [esp + 0x7c], eax
            //   0f8dd1010000         | jge                 0x1d7

        $sequence_3 = { 89542420 894c240c 8b4c2448 894c2408 e8???????? 8b54244c 8b442438 }
            // n = 7, score = 100
            //   89542420             | mov                 dword ptr [esp + 0x20], edx
            //   894c240c             | mov                 dword ptr [esp + 0xc], ecx
            //   8b4c2448             | mov                 ecx, dword ptr [esp + 0x48]
            //   894c2408             | mov                 dword ptr [esp + 8], ecx
            //   e8????????           |                     
            //   8b54244c             | mov                 edx, dword ptr [esp + 0x4c]
            //   8b442438             | mov                 eax, dword ptr [esp + 0x38]

        $sequence_4 = { e8???????? 89c5 8b442420 8d4c2434 8d542430 e8???????? 8d4c243c }
            // n = 7, score = 100
            //   e8????????           |                     
            //   89c5                 | mov                 ebp, eax
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   8d4c2434             | lea                 ecx, [esp + 0x34]
            //   8d542430             | lea                 edx, [esp + 0x30]
            //   e8????????           |                     
            //   8d4c243c             | lea                 ecx, [esp + 0x3c]

        $sequence_5 = { 890424 e8???????? 85c0 89442424 7555 8b6b08 bf???????? }
            // n = 7, score = 100
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   89442424             | mov                 dword ptr [esp + 0x24], eax
            //   7555                 | jne                 0x57
            //   8b6b08               | mov                 ebp, dword ptr [ebx + 8]
            //   bf????????           |                     

        $sequence_6 = { e8???????? e9???????? 85db 0f8414020000 83fb03 0f87d7020000 be30000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   e9????????           |                     
            //   85db                 | test                ebx, ebx
            //   0f8414020000         | je                  0x21a
            //   83fb03               | cmp                 ebx, 3
            //   0f87d7020000         | ja                  0x2dd
            //   be30000000           | mov                 esi, 0x30

        $sequence_7 = { 8d7c242c c744240400000000 8b5c2444 8944240c 8d442428 890424 e8???????? }
            // n = 7, score = 100
            //   8d7c242c             | lea                 edi, [esp + 0x2c]
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   8b5c2444             | mov                 ebx, dword ptr [esp + 0x44]
            //   8944240c             | mov                 dword ptr [esp + 0xc], eax
            //   8d442428             | lea                 eax, [esp + 0x28]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     

        $sequence_8 = { f3a6 0f84d7000000 bf???????? b911000000 89c6 f3a6 0f85e8000000 }
            // n = 7, score = 100
            //   f3a6                 | repe cmpsb          byte ptr [esi], byte ptr es:[edi]
            //   0f84d7000000         | je                  0xdd
            //   bf????????           |                     
            //   b911000000           | mov                 ecx, 0x11
            //   89c6                 | mov                 esi, eax
            //   f3a6                 | repe cmpsb          byte ptr [esi], byte ptr es:[edi]
            //   0f85e8000000         | jne                 0xee

        $sequence_9 = { 8d7c244f 8d6c246f 890424 e8???????? 85c0 0f8e96020000 8db600000000 }
            // n = 7, score = 100
            //   8d7c244f             | lea                 edi, [esp + 0x4f]
            //   8d6c246f             | lea                 ebp, [esp + 0x6f]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f8e96020000         | jle                 0x29c
            //   8db600000000         | lea                 esi, [esi]

    condition:
        7 of them and filesize < 4489216
}